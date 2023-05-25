module Dependency
  module Attribute
    def self.define(receiver, attr_name, interface=nil, record=nil)
      SubstAttr::Attribute.define(receiver, attr_name, interface, record)
    end
  end
end
