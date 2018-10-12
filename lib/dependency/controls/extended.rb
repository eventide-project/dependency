module Dependency
  module Controls
    module Extended
      class Example
        extend ::Dependency

        dependency :some_attr, Dependency::Example
      end
    end
  end
end
