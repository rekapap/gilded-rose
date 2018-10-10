require 'ultraconjured'

describe UltraConjured do
  context 'before sell_in' do
    it 'does not change quality before sell in date' do
      item = UltraConjured.new("UltraConjured", 0, 3)
      item.update_quality
      expect(item.quality).to eq(3)
    end
  end

  context 'after sell_in' do
    it 'decrease quality by two after sell in date day' do
      item = UltraConjured.new("UltraConjured", -1, 3)
      item.update_quality
      expect(item.quality).to eq(0)
    end

    it 'never go under zero quality' do
      item = UltraConjured.new("UltraConjured", -1, 1)
      item.update_quality
      expect(item.quality).to eq(0)
    end
  end
end
