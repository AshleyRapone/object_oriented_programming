# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.new('brown')

=begin
-The @@cats_count is a class variable and gets set to zero when the Cat class is evaluated
-When the new class method is called on the Cat class and a new instance of the class Cat is created
the initialize method is invoked and the @@cats_count variable is incremented by 1
-When cats_count is called on the Cat class the @@cats_count class variable is returned which
represents how many times we instantiate a new object from the Cat class

-To test the theory I can call the new method on Cat as many times as I want and then
call the cats_count method on Cat and it will tell me how many cat objects I have 
=end
