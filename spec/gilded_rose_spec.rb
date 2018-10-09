require 'gilded_rose'
require 'item'
require 'new_classes'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      item = Normal.new("foo", 0, 0)
      GildedRose.new([item]).update_quality
      expect(item.name).to eq "foo"
    end

    it "lowers the sell_in by one after a day" do
      item = Normal.new("item", 1, 0)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq 0
    end

    it "never lowers quality below 0" do
      item = Normal.new("item", 0, 0)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end

    context 'when item is generic' do
      context 'before sell_in' do
        it 'lowers quality by one after one day' do
          item = Normal.new("item", 1, 1)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end
      end

      context 'after sell_in' do
        it 'lowers quality by two after a day' do
          item = Normal.new("item", 0, 2)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end
      end
    end

    context 'when item is Aged Brie' do
      context 'before sell_in' do
        it 'raises quality by one after a day' do
          item = Brie.new("Aged Brie", 1, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(1)
        end

        it 'never raises quality beyond 50' do
          item = Brie.new("Aged Brie", 1, 50)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(50)
        end
      end

      context 'after sell_in' do
        it 'raises quality by two after a day' do
          item = Brie.new("Aged Brie", 0, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(2)
        end

        it 'only raises quality to 50 when quality is at 49' do
          item = Brie.new("Aged Brie", 0, 49)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(50)
        end
      end
    end

    context 'when item is Sulfuras, Hand of Ragnaros' do
      it 'does not change sell_in' do
        item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)
        GildedRose.new([item]).update_quality
        expect(item.sell_in).to eq(1)
      end

      it 'does not change quality' do
        item = Sulfuras.new("Sulfuras, Hand of Ragnaros", 1, 80)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(80)
      end
    end

    context 'when item is Backstage passes to a TAFKAL80ETC concert' do
      context 'when sell_in is greater than 10' do
        it 'increases quality by one after each day' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 15, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(1)
        end

        it 'never increases quality beyond 50' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(50)
        end
      end

      context 'when sell_in is less than or equal to 10 but more than 5' do
        it 'increases quality by two after each day' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(2)
        end

        it 'only raises quality to 50 when quality is at 49' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(50)
        end
      end

      context 'when sell_in is less than or equal to 5 but more than 0' do
        it 'increases quality by three after each day' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(3)
        end

        it 'only raises quality to 50 when quality is at 48 or more' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 5, 48)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(50)
        end
      end

      context 'after sell_in' do
        it 'sets quality to 0' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end

        it 'does not change quality' do
          item = BackstagePass.new("Backstage passes to a TAFKAL80ETC concert", 0, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end
      end
    end

    context 'when item is Aged Cheddar' do
      context 'before sell_in' do
        it 'does not raises quality before sell in date' do
          item = Cheddar.new("Aged Cheddar", 0, 10)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(10)
        end
      end

      context 'after sell_in' do
        it 'raises quality by three after sell in date day' do
          item = Cheddar.new("Aged Cheddar", -1, 0)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(3)
        end
      end
    end

    context 'when item is Conjured Item' do
      context 'before sell_in' do
        it 'does not change quality before sell in date' do
          item = Conjured.new("Conjured", 0, 10)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(10)
        end
      end

      context 'after sell_in' do
        it 'decrease quality by two after sell in date day' do
          item = Conjured.new("Conjured", -1, 3)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(1)
        end

        it 'never go under zero quality' do
          item = Conjured.new("Conjured", -1, 1)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end
      end
    end

    context 'when item is UltraConjured Item' do
      context 'before sell_in' do
        it 'does not change quality before sell in date' do
          item = UltraConjured.new("UltraConjured", 0, 3)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(3)
        end
      end

      context 'after sell_in' do
        it 'decrease quality by two after sell in date day' do
          item = UltraConjured.new("UltraConjured", -1, 3)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end

        it 'never go under zero quality' do
          item = UltraConjured.new("UltraConjured", -1, 1)
          GildedRose.new([item]).update_quality
          expect(item.quality).to eq(0)
        end
      end
    end

    context 'when item is Yulfuras, Hand of Ragnaros' do
      it 'does not change sell_in' do
        item = Yulfuras.new("Yulfuras, Foot of Zeus", 1, 80)
        GildedRose.new([item]).update_quality
        expect(item.sell_in).to eq(1)
      end

      it 'does not change quality' do
        item = Yulfuras.new("Yulfuras, Foot of Zeus", 1, 80)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(80)
      end
    end
  end
end
