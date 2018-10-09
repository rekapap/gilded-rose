require_relative 'item.rb'

module Updater
  
  def increase_sell_in(num)
    self.sell_in += num
  end
  
  def increase_quality(num)
    self.quality += num
  end

  def increase_quality_by_one_if_less_50
    increase_quality(1) if self.quality < 50
  end

end

class Brie < Item
  include Updater

  def update_quality
    increase_quality(1) if quality < 50
    increase_sell_in(-1)
    increase_quality_by_one_if_less_50 if sell_in < 0
  end
end

class BackstagePass < Item
  include Updater

  def update_quality
    update_backstage_pass_quality if quality < 50
    increase_sell_in(-1)
    increase_quality(-quality) if sell_in < 0
  end

  def update_backstage_pass_quality
    increase_quality(1) 
    increase_quality_by_one_if_less_50 if sell_in < 11
    increase_quality_by_one_if_less_50 if sell_in < 6 
  end

end

class Normal < Item
  include Updater

  def update_quality
    increase_quality(-1) if quality > 0
    increase_sell_in(-1)
    increase_quality(-1) if sell_in < 0 && quality > 0
  end
end

class Cheddar < Item
  include Updater
  def update_quality
    increase_quality(3) if sell_in < 0
  end
end

class Conjured < Item
  include Updater
  def update_quality
    return unless sell_in < 0
    quality > 1 ? increase_quality(-2) : self.quality = 0
  end
end

class UltraConjured < Item
  include Updater
  def update_quality
    return unless sell_in < 0
    quality > 2 ? increase_quality(-3) : self.quality = 0
  end
end

class Sulfuras < Item
  include Updater
  def update_quality; end
end

class Yulfuras < Sulfuras
end
