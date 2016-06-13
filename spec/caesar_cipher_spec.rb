require "./caesar_cipher"

describe "caesar_cipher" do
  let(:string) { 'easy' }
  let(:complex_string) { "This one, well, it's a little more compleX!!!"}

  it "translates a letter by a given key" do
    expect(caesar_cipher('d', 3)).to eql 'a'
  end

  it "correctly cycles through 'z'" do
    expect(caesar_cipher('a', 3)).to eql 'x'
  end

  it "translates a simple string" do
    expect(caesar_cipher(string, 5)).to eql 'zvnt'
  end

  it "preserves capitalization and punctuation" do
    expect(caesar_cipher(complex_string, 4)).to eql "Pdeo kja, sahh, ep'o w heppha ikna ykilhaT!!!"
  end
end