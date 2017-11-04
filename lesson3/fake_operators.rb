# 1.
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)

puts "bob is older than kim" if bob > kim # NoMethodError

=begin
NoMethodError was given because Ruby cant find the > method for the bob object
=end

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)

puts "bob is older" if bob > kim   # => "bob is older"
puts "bob is older" if bob.>(kim)  # => "bob is older"

=begin
A custom > method was written for the objects of the Person class
WHen this method is called on the object bob we are comparing the @age instance
variable of bob to the @age instance variable of the other_person which is the
object kim since kim was passed into the method as an argument
=end

# 2.
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end
end

cowboys = Team.new("Dallas Cowboys")
emmitt = Person.new("Emmitt Smith", 46)

cowboys << emmitt

cowboys.members

=begin
The << method is being called on the cowboys object and the objec emmitt is being
passed in as an argument
-Inside the << method emmitt is passed to the local variable person
  -The push method is being called on the members instance variable and the person
  local variable which points to the emmitt object is added to the @membrs instance
  variable which contains an array
=end

# 3.
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    members + other_team.members
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
=begin
cowboys + niners returns a new array containing both team members
=end

class Team
  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end
end

dream_team = niners + cowboys
puts dream_team.inspect  # => #<Team:0x007fac3b9eb878 @name="Temporary Team" ...

=begin
-When the + method is executed the new class method is called on the class Team and
an new instance of the class Team is created and is stored in the temp_team variable
-Instantiation of the temp_team object casues the inititalize method to be executed and the
"Temporary Team" string that is passed into the new class method as an argument gets
passed to the local variable name of the inititalize method
-The instance variable @name now holds the string "Temporary Team" and the instance variable
@members is now inititalized to an empty array
-the @members instance variable from niners is concatenated with the @members instance variable
of the other_team (cowboys object) and is stored in the temp_team @members instance variable which
contains an array
the + method turns dream_team from an array to a Team object
=end

# 4.
my_array = %w(first second third fourth)
my_array[2]    # => "third"
my_array.[](2) # => "third"
# [] is a fake operator and is really an instance method

# 5.
my_array[4] = "fifth"
my_array.inspect # => ["first", "second", "third", "fourth", "fifth"]
my_array.[]=(5, "sixth")
my_array.inspect # => ["first", "second", "third", "fourth", "fifth", "sixth"]

# Array#[]= is really an instance method

# 4.
class Team
  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys.members
cowboys[1]   # => #<Person:0x007fae9295d830 @name="Emmitt Smith", @age=46>
cowboys[3] = Person.new("JJ", 72)
cowboys[3]   # => #<Person:0x007fae9220fa88 @name="JJ", @age=72>

=begin
We set our own [] and []= methods so that we can reference an item from the array
and can add a new item to an array
=end
