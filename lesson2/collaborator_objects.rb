# 1.
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

joe = Person.new("Joe")
joe.name                    # => "Joe"

=begin
The string "Joe" is an object of the string class and is being initialized to
the name state of the joe object
=end

# 2.
class Person
  def initialize
    @heroes = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
  end

  def cash_on_hand
    # this method will use @cash to calculate total cash value
    # we'll skip the implementation
  end

  def heroes
    @heroes.join(', ')
  end
end

joe = Person.new
joe.cash_on_hand            # => "$62.00"
joe.heroes                  # => "Superman, Spiderman, Batman"

=begin
Instance variables can be set to any object
=end

# 3.
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
bob.pet # => #<Bulldog:0x007fd8399eb920>
bob.pet.class # => Bulldog

=begin
The object bob's pet instance variable is assigned to the bud object which is from the Bulldog class
bob.pet returns a Bulldog object
=end

# 4.
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
bob.pet.speak                 # => "bark!"
bob.pet.fetch                 # => "fetching!"

=begin
If I want the bulldog object bud to do something I can chain on the Bulldog class
methods to bob.pet
=end

# 5.
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]
bob.pets.jump                  # NoMethodError: undefined method `jump' for [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]:Array
bob.pets.each do |pet|
  pet.jump
end

=begin
To have each object in an array or hash of an instance variable perform some action
you must iterate through the data structure and call the method on each item
=end
