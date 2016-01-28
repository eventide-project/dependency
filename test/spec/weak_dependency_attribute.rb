require_relative 'spec_init'

module WeakDependencyAttribute
  class Example
    extend Dependency::Macro

    dependency :some_dependency
  end
end

context WeakDependencyAttribute::Example do
  context "Dependency attribute with a weak null object value" do
    test "The dependency responds to any method" do
      begin
        subject.some_dependency.some_method
      rescue => error
      end

      assert error
    end
  end
end
