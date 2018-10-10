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
