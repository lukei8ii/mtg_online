class Battlefield
  attr_accessor :land
  attr_accessor :main
  attr_accessor :side

  def initialize
    @main = []
    @side = []
    @land = []
  end
end
