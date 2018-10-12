require_relative '../automated_init'

context "Activation" do
  context "Include" do
    cls = Dependency::Controls::Included::Example

    test "The class includes the dependency macro" do
      assert(cls.is_a?(Dependency::Macro))
    end
  end
end
