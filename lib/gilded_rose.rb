class GildedRose

  def initialize(items)
    @items = items
    @brie = 'Aged Brie'
    @backstage = 'Backstage passes to a TAFKAL80ETC concert'
    @sulfuras = 'Sulfuras, Hand of Ragnaros'
  end

  def update_quality
    @items.each do |item|
      case item.name
      when @brie then brie(item)
      when @backstage then backstage(item)
      else
        unless item_name(item, @sulfuras)
          normal(item)
        end
      end
    end
  end

  def brie(item)
    quality_change(item, 1) if item.quality < 50
    sell_in_change(item, -1)
    quality_change_less_50(item) if item.sell_in < 0
  end
  
  def backstage(item)
    backstage_changes(item) if item.quality < 50
    sell_in_change(item, -1)
    quality_change(item, -item.quality) if item.sell_in < 0
  end
  
  def normal(item)
    quality_change(item, -1) if item.quality > 0
    sell_in_change(item, -1)
    quality_change(item, -1) if item.sell_in < 0 && item.quality > 0
  end

  def item_name(item, name)
    item.name == name
  end
  
  def sell_in_change(item, num)
    item.sell_in += num
  end
  
  def quality_change(item, num)
    item.quality += num
  end

  def backstage_changes(item)
    quality_change(item, 1) 
    quality_change_less_50(item) if item.sell_in < 11
    quality_change_less_50(item) if item.sell_in < 6 
  end

  def quality_change_less_50(item)
    quality_change(item, 1) if item.quality < 50
  end

end
