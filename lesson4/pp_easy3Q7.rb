class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# What is used in this class but doesn't add any value?

=begin
The return keyword does not add any value because the method will automatically return the last
executable line in a method so since there is only one line it is not necessary to type return
=end
