require_relative 'conjured'

class UltraConjured < Conjured
  include Updater
  
  def quality_loss
    @quality_loss = -3
  end
end
