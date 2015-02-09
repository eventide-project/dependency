module Dependency
  module Macro
    def dependency_macro(attr_name, interface=nil)
      NullAttr::Attribute.define self, attr_name, interface
    end
    alias :dependency :dependency_macro
  end
end
