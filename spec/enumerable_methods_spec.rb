require "./enumerable_methods"

describe Enumerable do
  let(:empty_array) { [] }
  let(:array)       { [1, 2, 3, 4] }
  let(:nil_array)   { [1, 2, nil, 4] }
  let(:false_array) { [nil, nil, false, nil] }
  
  describe "#my_each" do
    context "without block" do
      it "returns an enumerator" do
        expect(array.my_each).to be_instance_of Enumerator
      end
    end

    context "with block" do
      it "iterates through a block, and applies instructions" do
        expect(array.my_each{ |i| empty_array << i+2 }).to eql array
        expect(empty_array).to eql [3, 4, 5, 6]
      end

      it "returns empty array when given an empty array" do
        expect([].my_each { |i| empty_array << i + 2 }).to eql []
        expect(empty_array).to eql []
      end
    end
  end

  describe "#my_all?" do
    context "without block" do
      it "returns true if no elements false or nil" do
        expect(array.my_all?).to be_truthy
      end

      it "returns false when any elements false or nil" do
        expect(false_array.my_all?).to be_falsey
        expect(nil_array.my_all?).to be_falsey
      end
    end

    context "with block" do
      it "returns true if all elements return true" do
        expect(array.my_all? { |i| i < 5 }).to be_truthy
      end

      it "returns false if any elements return false" do
        expect(array.my_all? { |i| i > 3 }).to be_falsey
        expect(false_array.my_all? { |i| i }).to be_falsey
      end
    end
  end

  describe "#my_map" do
    context "without block" do
      it "returns an enumerator" do
        expect(array.my_map).to be_instance_of Enumerator
      end
    end

    context "with block" do
      it "returns array with instructions applied" do
        expect(array.my_map { |i| i + 2 }).to be_eql [3,4,5,6]
      end

      it "returns empty array when given empty array" do
        expect(empty_array.my_map { |i| i * 5}).to be_eql []
      end
    end
  end
end