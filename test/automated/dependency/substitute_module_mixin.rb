require_relative '../automated_init'

context "Dependency" do
  context "Substitute Module Mixin" do
    example = Controls::Example.new

    substitute = example.mixed_in_mimic_substitute_attr

    detail "Substitute: #{substitute.inspect}"
    detail "Substitute Ancestors: #{substitute.class.ancestors.inspect}"

    context "No Substitute Module Constructor" do
      has_constructor = Controls::Dependency::MixinSubstitute::Example::Substitute.methods.include?(:build)

      test do
        refute(has_constructor)
      end
    end

    context "Substitute Module Is Mixed In" do
      substitute_module_mixed_in = substitute.is_a?(Controls::Dependency::MixinSubstitute::Example::Substitute)

      test do
        assert(substitute_module_mixed_in)
      end
    end
  end
end
