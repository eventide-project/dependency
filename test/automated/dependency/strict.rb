require_relative '../automated_init'

context "Dependency" do
  context "Strict Substitute" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented on the Impersonated Class" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.strict_substitute_attr.some_method
        end
      end
    end
  end
end
