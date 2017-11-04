class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

# If we call Hello.hi we get an error message. How would you fix this?

=begin
-I would fix this by calling the new class method on Hello and then calling the hi
method on the instance of the class Hello
-The reason for this is because the hi method inside the Hello class is an instance method
and not a class method
-When we call a method directly on the class we are calling a class method in which Ruby looks for that method
with the keyword self prepended to the method name
=end

# the below can also be done:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

=begin
-We have to instantiate the greeting object from the Greeting class and call the greet
 method with an argument passed in on the greeting object in order for the instance method to be invoked
-The reason for this is because in order to call a instance method we have to call it on the instantiated object
=end
