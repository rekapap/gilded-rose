require_relative 'item'
require_relative 'updatable_item'

class Conjured < UpdatableItem

  def update_quality
    return unless sell_in < 0
    quality > 1 ? increase_quality(quality_loss) : self.quality = 0
  end

  protected
  def quality_loss
    -2
  end
end
