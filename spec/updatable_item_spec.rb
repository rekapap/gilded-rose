require 'updatable_item'
require 'brie'

describe UpdatableItem do
  subject { UpdatableItem.new('name', 0, 0)}

  describe '#increase_sell_in' do
    it 'increases sell in' do
      subject.increase_sell_in(1)
      expect(subject.sell_in).to eq 1
    end
  end

  describe '#increase_quality' do
    it 'increases quality' do
      subject.increase_quality(1)
      expect(subject.quality).to eq 1
    end
  end

  describe '#increase_quality_by_one_if_less_50' do

    context 'quality less then 50' do
      it 'increases quality' do
        subject.increase_quality(1)
        expect(subject.quality).to eq 1
      end
    end

    context 'quality is 50' do
      subject { UpdatableItem.new('name', 0, 50) }

      it 'not increase quality if quality is 50' do
        subject.increase_quality_by_one_if_less_50
        expect(subject.quality).to eq 50
      end

    end

    context 'quality is more than 50' do
      subject { UpdatableItem.new('name', 0, 55) }

      it 'not increase quality if quality is more then 50' do
        subject.increase_quality_by_one_if_less_50
        expect(subject.quality).to eq 55
      end

    end

  end

  context 'items with an even number of vowels in the name' do
    subject { UpdatableItem.new('name', 0, 55, 1, 2) }

    it 'changes half as fast, should not have changed after one update' do
      expect(subject).not_to receive(:update_quality)
      subject.update
    end

    it 'changes half as fast, should update only once after being called twice' do
      expect(subject).to receive(:update_quality).once
      subject.update
      subject.update
    end

    it 'should update twice when called 4 times' do
      expect(subject).to receive(:update_quality).twice
      subject.update
      subject.update
      subject.update
      subject.update
    end

  end

  context 'test update rate of 3' do
    subject { UpdatableItem.new('name', 0, 55, 1, 3) }

    it 'should update twice when called 6 times' do
      expect(subject).to receive(:update_quality).twice
      subject.update
      subject.update
      subject.update
      subject.update
      subject.update
      subject.update
    end

  end
end
