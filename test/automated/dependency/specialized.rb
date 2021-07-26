require_relative '../automated_init'

context "Dependency" do
  context "Specialized Substitute" do
    example = Controls::Example.new

    comment example.specialized_substitute_attr.inspect

    test do
      assert(example.specialized_substitute_attr == :some_substitute)
    end
  end
end
