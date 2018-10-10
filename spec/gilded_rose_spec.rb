require 'gilded_rose'
require 'item'

describe GildedRose do
  let(:item) { double :item, :update_quality => true }
  subject { GildedRose.new([item])}

  context '#update_quality' do
    it 'calls the update quality on the items it holds' do 
      expect(item).to receive(:update_quality)
      subject.update_quality
    end
  end
  
end
