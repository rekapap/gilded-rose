require_relative 'item'
require_relative 'updatable_item'

class Brie < UpdatableItem

  def update_quality
    increase_quality_by_one_if_less_50
    increase_sell_in(-1) if quality < 50
    increase_quality_by_one_if_less_50 if sell_in < 0
  end
  
end
