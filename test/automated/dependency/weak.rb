require_relative '../automated_init'

context "Dependency" do
  context "Weak" do
    example = Dependency::Controls::Example.build

    context "Invoking Methods Not Implemented" do
      test "Is not an error" do
        refute proc { example.weak_attr.some_method } do
          raises_error? NoMethodError
        end
      end
    end
  end
end

