require 'updatable_item'

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


  # describe '#extreme_update_quality?' do
  #   subject { UpdatableItem.new('eXtreme item', 0, 0) }

  #   it 'has a constant EXTReme, with a the value of 2' do
  #     expect(UpdatableItem::EXTREME).to eq 2
  #   end

  #   it 'calls the update quality method twice ' do
  #     expect(subject).to receive(:update_quality).twice
  #     subject.extreme_update_quality
  #   end

# end

end
