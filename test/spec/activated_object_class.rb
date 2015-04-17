module ActivatedObjectClass
  Dependency.activate
end

describe ActivatedObjectClass do
  context "Dependency is not activated for a specific class" do
    specify "Dependency is activated for the Object class" do
      expect(Object).to be_a Dependency::Macro
    end
  end
end
