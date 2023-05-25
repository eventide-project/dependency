module Dependency
  module Macro
    def dependency_macro(attr_name, interface=nil, record: nil)
      Attribute.define(self, attr_name, interface, record)
    end
    alias :dependency :dependency_macro
  end
end
