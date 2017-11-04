module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title
  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
puts mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
puts kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
puts flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
p byron.name
# => "Byron"
p byron.title
# => "Lord"
