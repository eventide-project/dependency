require_relative '../../automated_init'

context "Dependency" do
  context "Construction" do
    context "No Interface Specified" do
      substitute = Dependency::Substitute.build

      ancestry = substitute.class.ancestors

      comment "Substitute: #{substitute.inspect}"
      comment "Ancestors: #{ancestry.inspect}"

      test "Creates null object" do
        assert(substitute.class == SubstAttr::Substitute::NullObject::Implementation)
      end
    end
  end
end
