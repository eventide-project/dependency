require_relative '../automated_init'

context "Activation" do
  context "Extend" do
    cls = Dependency::Controls::Extended::Example

    test "The class includes the dependency macro" do
      assert(cls.is_a?(Dependency::Macro))
    end
  end
end
