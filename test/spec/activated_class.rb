require_relative 'spec_init'

module ActivatedClass
  class Example
  end

  Dependency.activate Example

  class Example
    dependency :some_dependency
  end
end

describe ActivatedClass::Example do
  context "NullAddr is activated for a specific class" do
    specify "The class is a NullAttr" do
      assert(ActivatedClass::Example.is_a? Dependency::Macro)
    end
  end
end
