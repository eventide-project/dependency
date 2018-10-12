require_relative '../automated_init'

context "Activation" do
  context "Include" do
    cls = Controls::Included::Example

    test "The class includes the dependency macro" do
      assert(cls.respond_to?(:dependency))
    end
  end
end
