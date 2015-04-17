module StrictDependencyAttribute
  class SomeDependency
    def a_method; end
  end

  class Example
    extend Dependency::Macro

    dependency :some_dependency, SomeDependency
  end
end

describe StrictDependencyAttribute::Example do
  context "Dependency attribute with a strict null object value" do

    specify "The dependency doesn't respond to methods not on the impersonated interface" do
      expect { subject.some_dependency.some_method }.to raise_error
    end

    specify "The dependency responds to methods on the impersonated interface" do
      expect { subject.some_dependency.a_method }.to_not raise_error
    end
  end
end
