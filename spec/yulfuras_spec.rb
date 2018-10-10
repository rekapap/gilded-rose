require 'yulfuras'

describe Yulfuras do
  it 'does not change sell_in' do
    item = Yulfuras.new("Yulfuras, Foot of Zeus", 1, 80)
    item.update_quality
    expect(item.sell_in).to eq(1)
  end

  it 'does not change quality' do
    item = Yulfuras.new("Yulfuras, Foot of Zeus", 1, 80)
    item.update_quality
    expect(item.quality).to eq(80)
  end
end
