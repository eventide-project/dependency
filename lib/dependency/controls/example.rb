module Dependency
  module Controls
    class Example
      include ::Dependency

      dependency :specialized_substitute_attr, Dependency::Example

      dependency :strict_substitute_attr, Dependency::NoSubstitute::Example

      dependency :weak_substitute_attr

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end
    end
  end
end
