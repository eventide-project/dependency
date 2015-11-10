require_relative 'spec_init'

module WeakDependencyAttribute
  class Example
    extend Dependency::Macro

    dependency :some_dependency
  end
end

describe WeakDependencyAttribute::Example do
  context "Dependency attribute with a weak null object value" do
    specify "The dependency responds to any method" do
      assert_raises { subject.some_dependency.some_method }
    end
  end
end
