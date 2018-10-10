require 'cheddar'

describe Cheddar do
  context 'before sell_in' do
    it 'does not raises quality before sell in date' do
      item = Cheddar.new("Aged Cheddar", 0, 10)
      item.update_quality
      expect(item.quality).to eq(10)
    end
  end

  context 'after sell_in' do
    it 'raises quality by three after sell in date day' do
      item = Cheddar.new("Aged Cheddar", -1, 0)
      item.update_quality
      expect(item.quality).to eq(3)
    end
  end
end
