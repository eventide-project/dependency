# Dependency

Declare dependency attributes that have default implementations that are diagnostic substitutes or null objects.

## Overview

An object's _dependencies_ are references to other objects that typically represent external I/O or system-level resources. Dependencies should be declared explicitly to differentiate them from other instance attributes.

A dependency attribute's value should never be `nil`. A dependency attribute is always assigned a default value that is an inert object that will not raise a `NoMethodError` when method's are invoked on the dependency, rather than a `nil`.

A dependency's default value may be a [null object](https://en.wikipedia.org/wiki/Null_object_pattern), an object with a static interface that mimics the a dependency's declared interface, or an entirely arbitrary object that can be constructed by implementing an explicit override of the dependency's construction.

A static mimic can be configured to record the invocations of it's methods.

## Constructing an Object that Has Dependencies

When an object that has declared dependencies is initialized, the values of its dependencies will never be nil. A dependency attribute will be assigned either a null object or an implementation of a substitute that conforms to the interface that a dependency may optionally be configured to support.

``` ruby
class Example
  dependency :some_dependency
end

e = Example.new
e.dependency.nil? #=> false
```

To construct an object and provide its dependencies with real, _operational_ values, implement a constructor method that will be used by operational code.

``` ruby
class Example
  dependency :some_dependency

  def self.build
    instance = new
    instance.some_dependency = SomeDependency.new
    instance
  end
end

# Non-operational, substitute dependencies when the instance has only been initialized
e = Example.new
e.dependency.class #=> NullObject

# Operational dependencies when the instance has been fully constructed
e = Example.build
e.dependency.class #=> SomeDependency
```

## Substitutes

### Null Object

A null object responds to any method invoked on it. If the dependency declaration doesn't include an interface to mimic, the dependency attribute's default value will be a null object.

```ruby
class Example
  dependency :some_dependency
end

e = Example.new
e.some_dependency.anything # => No error raised
```

### Static Mimic

A static mimic responds only to the methods of the dependency's declared interface.

```ruby
class SomeClass
  def some_method
    # ...
  end
end

class Example
  dependency :some_dependency, SomeClass
end

e = Example.new
e.some_dependency.some_method # => No error raised
e.some_dependency.anything # => NoMethodError raised
```

#### Invocation Recording

Static mimic dependencies record the methods invoked on them.

```ruby
class Example
  dependency :some_dependency, SomeClass
end

e = Example.new
e.some_dependency.some_method

e.invoked?(:some_method) #=> true
```

Invocation recording can be disabled using the dependency declaration's `record` parameter.

```ruby
class Example
  dependency :some_dependency, SomeClass, record: false
end
```

For more information about invocation recording, see the [Mimic library's documentation](https://github.com/eventide-project/mimic#recording-invocations-of-a-mimic-object).

### Specialized Mimic

A static mimic can be specialized by implementing an inner module named `Substitute` in the dependency constant. If that inner `Substitute` module exists in the dependency constant's namespace, it will be mixed in to the mimic.

```ruby
class SomeClass
  def some_method
    # ...
  end

  module Substitute
    def some_other_method
      # ...
    end
  end
end

class Example
  dependency :some_dependency, SomeClass
end

e = Example.new
e.some_dependency.some_other_method
```

#### Specialized Mimic with Invocation Recording and Predicates

The principle use of the inner `Substitute` module mixin is the definition of override methods that record their invocations, as well as the definition of domain-specific predicate methods that provide an applicative API for determining whether a substitute was actuated.

Including the `RecordInvocation` module allows a substitute's methods to be defined as recordable.

```ruby
class SomeClass
  def some_method
    # ...
  end

  module Substitute
    include Mimic::Recorder::Predicate

    record def some_method
      # Substitute implementation
    end

    def some_predicate?
      invoked?(:some_method)
    end
  end
end

class Example
  dependency :some_dependency, SomeClass

  def call
    some_dependency.some_method
  end
end

e = Example.new
e.()

e.dependency.some_predicate?
#=> true
```

For more information about invocation recording, see the [RecordInvocation library's documentation](https://github.com/eventide-project/record-invocation) and the [Mimic library's documentation](https://github.com/eventide-project/mimic#recording-invocations-of-a-mimic-object).

### Constructed Substitute

A dependency's default value can be an entirely arbitrary object that can be constructed by implementing an explicit override of the dependency's construction.

If the dependency's constant has an inner namespace named `Substitute`, and if that `Substitute` module has a `self.build` class method, then the result of invoking the `build` method will be used as the dependency's default value.

```ruby
class SomeClass
  def some_method
    # ...
  end

  module Substitute
    def self.build
      SomeOtherSubstitute.new
    end
  end
end

class Example
  dependency :some_dependency, SomeClass
end

e = Example.new
e.some_dependency #=> SomeOtherSubstitute
```

### Constructing and Testing a Substitute

The Dependency library offers a single utility to construct any substitute of a dependency, whether it be a null object, a static mimic, or a constructed dependency.

``` ruby
some_class_substitute_instance = Dependency::Substitute.build(SomeClass)
```

This constructor will return an instance of whichever kind of substitute that is defined by the class passed to it.

The most common use for this utility is the construction of diagnostic substitute directly within a test script to test any specialized behavior that the substitute may have.

## Activation

The `Dependency` module must be included in a class that will use the `dependency` macro.

```Ruby
class Example
  include Dependency

  dependency :some_dependency
end
```

However, the `Dependency` module can be included anywhere within the object hierarchy by using the `Dependency.activate` method.

```Ruby
class Example
end

Dependency.activate Example

class Example
  dependency :some_attr
end
```

As in the example above, for a class to be "activated" for `Dependency`, it must have already been defined. The `dependency` class method must be visible to the class using it, either my including it in the class directly, or by including it in any super class of the using class.

If no class is specified, `Dependency` is included in Object, making the `dependency` macro available in all Ruby classes. Note that this isn't recommended practice.

```Ruby
Dependency.activate

class Example
  dependency :some_attr
end
```

## License

The `dependency` library is released under the [MIT License](https://github.com/eventide-project/dependency/blob/master/MIT-License.txt).
