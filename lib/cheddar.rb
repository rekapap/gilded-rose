require_relative 'item'
require_relative 'updatable_item'

class Cheddar < UpdatableItem

  def update_quality
    return unless sell_in < 0
    quality < 47 ? increase_quality(3) : self.quality = 50
  end
end
