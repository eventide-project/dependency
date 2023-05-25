require_relative '../automated_init'

context "Dependency" do
  context "Interface Mimic Substitute" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented By the Interface" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.mimic_substitute_attr.some_missing_method
        end
      end
    end
  end
end
