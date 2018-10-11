require_relative 'updatable_item'

class ItemFactory

  def self.create_item(name, sell_in, quality, type = UpdatableItem)
    update_times = name.upcase.include?('EXTREME') ? 2 : 1
    type.new(name, sell_in, quality, update_times)
  end

end
