module Dependency
  module Controls
    class Example
      include ::Dependency

      dependency :some_attr, Dependency::Example

      dependency :weak_attr

      def self.build
        new.tap do |instance|
          Dependency::Example.configure(instance)
        end
      end
    end
  end
end
