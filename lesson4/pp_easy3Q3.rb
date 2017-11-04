class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

bob = AngryCat.new(20, "bob")
debby = AngryCat.new(8, "debby")

# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class, both with separate names and ages?

=begin
-We create two different instances of the AnryCat class by instantiating two instances of the AngryCat class and
passing in diffent ages and names to the new class method which will get passed to the initialize method because the
initialize method gets invoked when we instantiate a new object
-Inside the initialize method the @age instance variable is assigned to the first argument and the @name instance method
is assigned to the second argument
-The @age and @name instance variables track the state(atrributes) of the objects thus each object can have dirrent states
=end
