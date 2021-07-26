require_relative '../automated_init'

context "Dependency" do
  context "Weak Substitute" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute_raises(NoMethodError) do
          example.weak_substitute_attr.some_method
        end
      end
    end
  end
end
