require_relative '../automated_init'

context "Activate" do
  context "Dependency is activated for a specific class" do
    some_class = Class.new

    Dependency.activate(some_class)

    test "The class is a SubstAttr" do
      assert(some_class.is_a?(Dependency::Macro))
    end
  end
end
