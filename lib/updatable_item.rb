require_relative 'item'

class UpdatableItem < Item
  
  def initialize(name, sell_in, quality, update_times = 1)
    super(name, sell_in, quality)
    @update_times = update_times
  end

  def increase_sell_in(num)
    self.sell_in += num
  end
  
  def increase_quality(num)
    self.quality += num
  end

  def increase_quality_by_one_if_less_50
    increase_quality(1) if self.quality < 50
  end

  def update
    @update_times.times { self.update_quality }
  end

  private
  def update_quality; end

end
