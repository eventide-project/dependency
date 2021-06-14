require_relative '../../automated_init'

context "Build Substitute" do
  context "Class Implements A Specialized Substitute" do
    cls = Controls::Dependency::Example

    substitute = Dependency::Substitute.build(cls)

    test "Returns the substitute" do
      assert(substitute == :some_substitute)
    end
  end

  context "Class Doesn't Implement A Specialized Substitute" do
    cls = Controls::Example

    substitute = Dependency::Substitute.build(cls)

    compare_methods = substitute.methods - Mimic.preserved_methods
    compare_methods.sort!

    control_methods = Mimic.subject_methods(cls).map { |method| method.name }
    control_methods.sort!

    comment "Substitute Methods: #{compare_methods.inspect}"
    detail "Control Methods: #{control_methods.inspect}"

    is_strict_null_object = compare_methods == control_methods

    test "Returns a strict null object" do
      assert(is_strict_null_object)
    end
  end
end
