class MyClass
  attr_reader :arg1, :arg2, :arg3
  def initialize(arg1, arg2, arg3)
    @arg1 = arg1
    @arg2 = arg2
    @arg3 = arg3
  end

end


class YourClass < MyClass
  attr_reader :arg4
  def initialize
    @arg4 = 'arg4'
    super
  end
end


yourclass = YourClass.new(1,2,3)
puts yourclass.arg4