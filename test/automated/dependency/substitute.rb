require_relative '../automated_init'

context "Replace an Attribute with its Substitute" do
  example = Dependency::Controls::Example.build
  assert(example.some_attr.is_a?(Dependency::Controls::Dependency::Example))

  Dependency::Substitute.(:some_attr, example)

  test "Attribute is replaced with its substitute" do
    assert(example.some_attr == :some_substutute)
  end
end
