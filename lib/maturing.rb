require_relative 'item'
require_relative 'updater'

class Maturing < Item
  include Updater

  def update_quality
    increase_quality(1) if quality < 50
    increase_sell_in(-1)
    aging if sell_in < 0
  end

  def aging
    increase_quality_by_one_if_less_50
  end
end
