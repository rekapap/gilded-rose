require_relative 'item.rb'
require_relative 'updater.rb'

class Normal < Item
  include Updater

  def update_quality
    increase_quality(-1) if quality > 0
    increase_sell_in(-1)
    increase_quality(-1) if sell_in < 0 && quality > 0
  end
end