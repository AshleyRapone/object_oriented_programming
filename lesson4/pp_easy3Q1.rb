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

# What happens in each of the following cases:

# case 1
hello = Hello.new
hello.hi
=begin
-The new class method is called on the Hello class which creates a new instance of the
class Hello which is stored in the variable hello
-the hi method is called on the hello object and the hi method in the Hello class is invoked
-Inside the hi method in the Hello class
  -The greet method is invoked and Ruby executes the greet method in the superclass Greeting class
  because there is no greet method in the Hello class
  -The "Hello" string is passed to the greet method which gets passed to the message local variable of the greet method
  -Inside the greet method in the Greeting class:
    -puts message is invoked and the output is: Hello
=end

# case 2
hello = Hello.new
hello.bye
=begin
-The new class method is called on the Hello class which creates a new instance of the
class Hello which is stored in the variable hello
-The bye method is called on the hello object and an error NoMethodError is returned because
the class Hello does not have a bye method and the superclass Greeting also does not have a bye method
=end

# case 3
hello = Hello.new
hello.greet
=begin
-The new class method is called on the Hello class which creates a new instance of the
class Hello which is stored in the variable hello
-The greet method is called on the object hello and an error pops up stating that there
are no arguments and  it is expecting 1 argument
-There is no greet method in the Hello class so Ruby looks for the greet method in the superclass
Greeting and invokes the greet method; however the greet method in the Greeting class takes one parameter
and we did not pass in an argument when the greet method was called and so an error is returned
=end

# case 4
hello = Hello.new
hello.greet("Goodbye")
=begin
-The new class method is called on the Hello class which creates a new instance of the
class Hello which is stored in the variable hello
-The greet method is called on the object hello and the greet method in the Greeting
superclass is invoked because there is no greet method in the Hello class so Ruby looks for the
greet method in the superclass Greeting
-The string "Goodbye" is passed to the greet which gets passe to the local variable message
-Inside the greet message in the Greeting class:
  -puts message is called and outputs: Goodbye
=end

# case 5
Hello.hi
=begin
The hi method is called on the class Hello; however, a NoMethodError pops up because
there is no class method called hi in the Hello class or its superclass Greeting
-When we call the hi method directly on the class instead of the instance of the class we are
trying to invoke a class method which in this case does not exist
=end
