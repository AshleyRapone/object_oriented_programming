class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way each code works?

=begin
-For the first Computer class we have @template instead of the second Computer class that has
self.template
  -The self in front of the template refers to the template setter method which references the @template instance variable

-For the first Computer class we have on line 9 template in which since we have attr_accessor we can reference the template method
instead of the @template method

-For the second Computer class we have on line 21 self.template
which refers to the template method and the self is prepended onto template to show that
it is not a local variable

** either way each code is written correctly, however it is best to avoid using self when not needed

=end
