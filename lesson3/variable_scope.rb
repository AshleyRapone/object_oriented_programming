# 1.
class Person
  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

p bob  # => #<Person:0x007f9c830e5f70 @name="bob">
p joe  # => #<Person:0x007f9c830e5f20 @name="joe">

# The @name instance vairable is scoped at the object level

# 2.
class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name
  end
end

bob = Person.new('bob')
bob.get_name # => "bob"

# The instance variable @name is accessible in the object bob's instance method even
# if the instance variable is not passed into the method and the instance variable is
# initialized outside of that instance method

# 3.
class Person
  def get_name
    @name
  end
end

bob = Person.new
bob.get_name   # => nil

# Referencing an uninitialized instance variable will return nil

# 4.
class Person
  @name = "bob"

  def get_name
    @name
  end
end

bob = Person.new
bob.get_name # => nil

# when you initialize an instance variable at the class level and try to reference that
# instance variable via a method, nil will be returned
# instance variables that are inititalized at the class level are called class instance
# variables

# 5.
class Person
  @@total_people = 0

  def self.total_people
    @@total_people
  end

  def initialize
    @@total_people += 1
  end

  def total_people
    @@total_people
  end
end

Person.total_people  # => 0
Person.new
Person.new
Person.total_people  # => 2

bob = Person.new
bob.total_people  # => 3

joe = Person.new
joe.total_people  # => 4

Person.total_people  # => 4

# Two different objects of the same class share the @@total_people class variable

# 6.
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

Person.titles  # => "Mr, Mrs, Ms, Dr"

bob = Person.new('bob')
bob.name # => "Ms bob"

# Constants can be accessed from instance or class methods when defined within a class
