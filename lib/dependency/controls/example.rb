module Dependency
  module Controls
    class Example
      include ::Dependency

      dependency :null_object_substitute_attr

      dependency :mimic_substitute_attr, Dependency::NoSubstituteModule::Example
      dependency :no_recorder_mimic_substitute_attr, Dependency::NoSubstituteModule::Example, record: false
      dependency :mixed_in_mimic_substitute_attr, Dependency::MixinSubstitute::Example

      dependency :constructed_substitute_attr, Dependency::Example

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end
    end
  end
end
