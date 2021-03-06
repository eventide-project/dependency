# dependency

Attribute with null object default

## Examples

### A Weak Null Object

Responds to any method

```ruby
class Example
  dependency :some_attr
end

e = Example.new
e.some_attr.anything # => No error raised
```

### A Strict Null Object

Responds only to the methods of the provided class

```ruby
class SomeDependency
  def some_method
    # ...
  end
end

class Example
  dependency :some_attr, SomeDependency
end

e = Example.new
e.some_attr.some_method # => No error raised
e.some_attr.anything # => NoMethodError is raised
```

## Specialized Substitute

If the class used to define the null object's strict interface has an inner `Substitute` namespace that has a `build` method, the null object will be the object returned from that build method.

```ruby
class SomeDependency
  def some_method
    # ...
  end

  module Substitute
    def self.build
      SomeOtherNullObjectLibrary.etc
    end
  end
end

class Example
  dependency :some_attr, SomeDependency
end

e = Example.new
```

## Activation

The `Dependency` module must be included in a class that will use the `dependency` macro.

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

If no class is specified, `Dependency` is included in Object, making the `dependency` macro available in all Ruby classes.

```Ruby
Dependency.activate

class Example
  dependency :some_attr
end
```

## License

The `dependency` library is released under the [MIT License](https://github.com/obsidian-btc/dependency/blob/master/MIT-License.txt).
