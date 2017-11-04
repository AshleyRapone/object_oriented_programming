class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

=begin
tv.manufacturer will return NoMethodError because there is no manufacturer instance method
-when model is called on the tv object the model method is invoked because the model instance method
exists and can be invoked
**We can only call instance methods on an instance of a class not the class itself
-when the manufacturer method is called on the Television class the self.manufacturer method is invoked because
when we call a method on a class directly Ruby can only execute the method if the self keyword is prepended to the method name
-Television.model is returns NoMethodError because there is no class method named model
there is only an instance method which can only be invoked on an instance of an object
=end
