# Which one of these is a class method (if any) and how do you know? How would you call a class method?

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Television.manufacturer

=begin
self.manufacturer is a class method
I know it is a class method because self is prepended to the method name
I would call a class method by calling the method name on the class name
=end
