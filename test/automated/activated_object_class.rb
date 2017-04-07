require_relative 'automated_init'

module ActivatedObjectClass
  Dependency.activate
end

context "Activated Object's Class" do
  context "Dependency is not activated for a specific class" do
    test "Dependency is activated for the Object class" do
      assert(Object.is_a? Dependency::Macro)
    end
  end
end
