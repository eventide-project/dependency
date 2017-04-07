require_relative 'automated_init'

module ActivatedClass
  class Example
  end

  Dependency.activate Example

  class Example
    dependency :some_dependency
  end
end

context "Activated Class" do
  context "NullAddr is activated for a specific class" do
    test "The class is a NullAttr" do
      assert(ActivatedClass::Example.is_a? Dependency::Macro)
    end
  end
end
