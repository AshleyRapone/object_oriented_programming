# 1. Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end


bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'


# 2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

class Person
  attr_reader :first_name
  attr_accessor :last_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

  def name
    "#{first_name} #{last_name}"
  end
end


bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
puts bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

# or

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

# 3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

  def name=(new_name)
    self.first_name = new_name.split[0]
    self.last_name = new_name.split[1]
  end

  def name
    "#{first_name} #{last_name}"
  end
end


bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
puts bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

puts bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

# or

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

# or

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

  def name=(new_name)
    self.first_name = new_name.split[0]
    self.last_name = new_name.split[1]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def same_name?(other_person)
    name == other_person.name
  end
end


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.same_name?(rob)

# 5. Continuing with our Person class definition, what does the below print out?

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

  def name=(new_name)
    self.first_name = new_name.split[0]
    self.last_name = new_name.split[1]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def same_name?(other_person)
    name == other_person.name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# The person's name is: #<Person:0x007fb9db803a58>

# Let's add a to_s method to the class:

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

  def name=(new_name)
    self.first_name = new_name.split[0]
    self.last_name = new_name.split[1]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def same_name?(other_person)
    name == other_person.name
  end

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# The person's name is: Robert Smith
