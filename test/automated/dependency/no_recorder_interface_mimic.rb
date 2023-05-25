require_relative '../automated_init'

context "Dependency" do
  context "No Recorder Interface Mimic" do
    example = Controls::Example.new

    context "Invoking Methods Not Implemented By the Interface" do
      test "Is an error" do
        assert_raises(NoMethodError) do
          example.no_recorder_mimic_substitute_attr.some_missing_method
        end
      end
    end

    context "Recording" do
      test "Mimic is not a recorder" do
        refute(example.no_recorder_mimic_substitute_attr.is_a? Mimic::Recorder)
      end
    end
  end
end
