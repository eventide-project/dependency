module Dependency
  def self.activate(target_class=nil)
    target_class ||= Object

    return if target_class.ancestors.include? Dependency::Macro

    target_class.extend Dependency::Macro
  end
end
