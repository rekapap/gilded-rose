require_relative 'item'
require_relative 'updater'

class Legendary < Item
  include Updater
  def update_quality; end
end
