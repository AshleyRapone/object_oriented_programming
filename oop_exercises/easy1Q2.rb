class  Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# or

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @upcase_name = @name.upcase
    "My name is #{@upcase_name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
