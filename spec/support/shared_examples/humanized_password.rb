RSpec.shared_examples "generates password with required length" do
  it "generates password with correct length" do
    expect(context.size).to eq length
  end
end

RSpec.shared_examples "contains only letters" do
  it "generates password with only letters" do
    expect(context).to match(/[a-z]{5,9}/)
  end
end

RSpec.shared_examples "contains letters with 1-3 digits" do
  it "generates password with only letters" do
    expect(context.delete("^[a-z]").size).to be_between(6, 12)
    expect(context.delete("^[0-9]").size).to be_between(2, 4)
  end
end

RSpec.shared_examples "contains letters with 4-6 digits" do
  it "generates password with only letters" do
    # expect(context).to match(/[a-z]{6,8}\d{1,3}[a-z]{6,8}\d{1,3}/)
    expect(context.delete("^[a-z]").size).to be_between(12, 16)
    expect(context.delete("^[0-9]").size).to be_between(2, 5)
  end
end
