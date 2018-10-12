require_relative '../automated_init'

context "Activation" do
  context "Extend" do
    cls = Controls::Extended::Example

    test "The class includes the dependency macro" do
      assert(cls.respond_to?(:dependency))
    end
  end
end
