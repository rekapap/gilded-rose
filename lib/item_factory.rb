require_relative 'updatable_item'

class ItemFactory

  def create_item(name, sell_in, quality, type = UpdatableItem)
    update_times = extreme?(name) ? 2 : 1
    update_rate = even_vowels?(name) ? 2 : 1
    type.new(name, sell_in, quality, update_times, update_rate)
  end

  def extreme?(name)
    name.upcase.include?('EXTREME')
  end

  def even_vowels?(name)
    times = 0
    name.downcase.scan(/[aioue]/) { |_match| times += 1 }
    (times % 2).zero?
  end

end
