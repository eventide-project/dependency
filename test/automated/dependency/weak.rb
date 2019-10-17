require_relative '../automated_init'

context "Dependency" do
  context "Weak" do
    example = Controls::Example.build

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute_raises(NoMethodError) do
          example.weak_attr.some_method
        end
      end
    end
  end
end
