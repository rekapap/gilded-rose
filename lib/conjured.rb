require_relative 'item'
require_relative 'updater'

class Conjured < Item
  include Updater
  
  def update_quality
    return unless sell_in < 0
    quality > 1 ? increase_quality(quality_loss) : self.quality = 0
  end

  def quality_loss
    @quality_loss = -1
  end
end
