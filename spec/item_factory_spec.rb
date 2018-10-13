require 'item_factory'
require 'brie'

describe ItemFactory do
  describe '#create_item' do
    subject { ItemFactory.new.create_item('eXtreme itemes', 0, 0, Brie) }
    it "creates the correct item's update requirement from the name" do
      expect(subject).to receive(:update_quality).twice
      subject.update
      subject.update
    end
    it "creates the correct type" do
      expect(subject).to be_an_instance_of(Brie)
    end
  end

  describe '#extreme?' do
    subject { ItemFactory.new }
    it "returns true if 'extreme' (not case sensitive) is in the title of the object" do
      expect(subject.extreme?('eXtreme name')).to eq true
    end
    it "returns false if 'extreme' (not case sensitive) is not in the title of the object" do
      expect(subject.extreme?('name')).to eq false
    end
  end

  describe '#even vowels?' do
    subject { ItemFactory.new }
    it "returns true if there are even vowels in the title of the object" do
      expect(subject.even_vowels?('name')).to eq true
    end
    it "returns false if there are  not even vowels in the title of the object" do
      expect(subject.even_vowels?('namei')).to eq false
    end
  end
end
