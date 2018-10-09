module Dependency
  module Attribute
    def self.define(receiver, attr_name, interface=nil)
      SubstAttr::Attribute.define(receiver, attr_name, interface)
    end
  end
end
