class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

Light.light_information

# How could you change the method name below so that the method name is more clear and less repetitive.

=begin
instead of using self.light_information you can just change the method to information
because since it is already in the Light class we can assume that the information is refering to the light
Calling light_information on the class Light sounds redundant and Light.information is more clear
=end
