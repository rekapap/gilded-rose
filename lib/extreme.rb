class ExtremeItem < Item

  def extreme?
    self.name.upcase.include?('EXTREME')
  end

  def extreme_update_quality
    return self.update_quality unless extreme?
    EXTREME.times { self.update_quality }
  end

  protected
  def update_quality; end

end
