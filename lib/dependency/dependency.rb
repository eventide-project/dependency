module Dependency
  def self.included(cls)
    cls.class_exec do
      extend Macro
    end
  end

  def self.extended(cls)
    cls.class_exec do
      extend Macro
    end
  end
end
