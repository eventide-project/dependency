require_relative '../automated_init'

context "Activate" do
  context "Dependency is activated by default for the Object class" do
    unchanged_object_class = Object.clone

    Dependency.activate

    test "Object is a Dependency" do
      assert(Object.is_a?(Dependency::Macro))
    end

    Object = unchanged_object_class

    refute(Object.is_a?(Dependency::Macro))
  end
end
