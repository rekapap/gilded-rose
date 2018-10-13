require_relative 'item'

class UpdatableItem < Item
  
  def initialize(name, sell_in, quality, update_times = 1, update_rate = 1)
    super(name, sell_in, quality)
    @update_times = update_times
    @update_call = 0
    @rate = update_rate.dup
  end

  def increase_sell_in(num)
    @sell_in += num
  end
  
  def increase_quality(num)
    @quality += num
  end

  def increase_quality_by_one_if_less_50
    increase_quality(1) if quality < 50
  end

  def update
    @update_call += 1
    @update_times.times { update_quality } if (@update_call % @rate).zero?
  end

  private
  def update_quality; end

end
