require_relative 'spec_init'

module ActivatedObjectClass
  Dependency.activate
end

describe ActivatedObjectClass do
  context "Dependency is not activated for a specific class" do
    specify "Dependency is activated for the Object class" do
      assert(Object.is_a? Dependency::Macro)
    end
  end
end
