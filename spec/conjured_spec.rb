require 'conjured'

describe Conjured do
  context 'before sell_in' do
    it 'does not change quality before sell in date' do
      item = Conjured.new("Conjured", 0, 10)
      item.update_quality
      expect(item.quality).to eq(10)
    end
  end

  context 'after sell_in' do
    it 'decrease quality by two after sell in date day' do
      item = Conjured.new("Conjured", -1, 3)
      item.update_quality
      expect(item.quality).to eq(1)
    end

    it 'never go under zero quality' do
      item = Conjured.new("Conjured", -1, 1)
      item.update_quality
      expect(item.quality).to eq(0)
    end
  end
end
