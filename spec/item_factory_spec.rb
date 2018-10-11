require 'item_factory'

describe ItemFactory do
  describe 'extreme' do
    subject { ItemFactory.create_item('eXtreme item', 0, 0, Brie) }
    it "returns true if 'extreme' (not case sensitive) is in the title of the object" do
      expect(subject).to receive(:update_quality).twice
      subject.update
    end
  end
end
