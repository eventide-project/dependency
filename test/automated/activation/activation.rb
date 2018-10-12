require_relative '../automated_init'

context "Activation" do
  some_class = Class.new

  Dependency.activate(some_class)

  test "The class includes the dependency macro" do
    assert(some_class.is_a?(Dependency::Macro))
  end
end
