require 'normal'

describe Normal do
  it "does not change the name" do
    item = Normal.new("foo", 0, 0)
    item.update_quality
    expect(item.name).to eq "foo"
  end

  it "lowers the sell_in by one after a day" do
    item = Normal.new("item", 1, 0)
    item.update_quality
    expect(item.sell_in).to eq 0
  end

  it "never lowers quality below 0" do
    item = Normal.new("item", 0, 0)
    item.update_quality
    expect(item.quality).to eq(0)
  end

  context 'before sell_in' do
    it 'lowers quality by one after one day' do
      item = Normal.new("item", 1, 1)
      item.update_quality
      expect(item.quality).to eq(0)
    end
  end

  context 'after sell_in' do
    it 'lowers quality by two after a day' do
      item = Normal.new("item", 0, 2)
      item.update_quality
      expect(item.quality).to eq(0)
    end
  end
end
