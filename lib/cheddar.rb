require_relative 'maturing'

class Cheddar < Aged
  def aging
    quality < 47 ? increase_quality(3) : self.quality = 50
  end
end
