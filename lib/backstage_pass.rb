require_relative 'item'
require_relative 'updatable_item'

class BackstagePass < UpdatableItem

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
