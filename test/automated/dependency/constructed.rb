require_relative '../automated_init'

context "Dependency" do
  context "Constructed Substitute" do
    example = Controls::Example.new

    test do
      assert(example.constructed_substitute_attr == :some_substitute)
    end
  end
end
