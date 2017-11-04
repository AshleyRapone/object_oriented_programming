# 1.
str1 = "something"
str2 = "something"
str1_copy = str1

str1 == str2    # => true
str1 == str1_copy # => true
str2 == str1_copy # => true

str1.equal? str2  # => false
str1.equal? str1_copy  # => true
str2.equal? str1_copy # => false

# == is comparing the two variables values and equal? is comparing to see if the two variables
# point to the same object

# 2.
class Person
  attr_accessor :name
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2  # => false

bob_copy = bob
bob == bob_copy    # => true

# == for class objects is comparing to see if the two variables point to the same object

class Person
  attr_accessor :name

  def ==(other)
    name == other.name
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2  # => true

# The default BasicObject#== method is being overriden so that we compare the two
# variables to see if they contain the same value

# 3.
45 == 45.00  # => true

# the Fixnum#== method is being called and an integer is being compared with a float

45.00 == 45  # => true

# the Float#== method is being called and a float is being compared with an integer


# 3.
num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end

# the case statement uses Range#=== method to compare each when clause with num

# 4.
num = 25

if (1..50) === num
  puts "small number"
elsif (51..100) === num
  puts "large number"
else
  puts "not in range"
end

# The === method is invoked on the ranges and passes in the argument num
# === compares the ranges with the num and if the num belongs in the range then the
# condition evaulates to true and the code will be executed

# 5.
String === "hello"  # => true
String === 15  # => false

# true is returned on the first line because "hello" is an instance of String even though
# "hello" doesnt equal String
# false is returned on line 2 because 15 is an integer which doesnt equal String and and
# isn't an instance of the String class
