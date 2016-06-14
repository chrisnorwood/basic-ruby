require "./enumerable_methods"

describe Enumerable do
  let(:array) { [1, 2, 3, 4] }
  let(:empty_array) { [] }
  let(:nil_array) { [1, 2, nil, 4] }
  let(:false_array) { [nil, nil, false, nil] }
  
  describe "#my_each" do
    context "without block" do
      it "returns an enumerator" do
        expect(array.my_each).to be_instance_of Enumerator
      end
    end

    context "with block" do
      it "iterates through a block, and applies instructions"

      it "returns empty array when given an empty array"
    end
  end
end