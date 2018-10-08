require_relative '../automated_init'

context "Dependency" do
  context "Strict" do
    example = Dependency::Controls::Example.build

    context "Invoking Methods Not Implemented on the Impersonated Class" do
      test "Is an error" do
        assert proc { example.some_attr.some_method } do
          raises_error? NoMethodError
        end
      end
    end
  end
end
