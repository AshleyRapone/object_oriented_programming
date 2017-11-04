class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

cat = Cat.new('Calico')
puts cat.make_one_year_older

# In the make_one_year_older method we have used self. What is another way we could
# write this method so we don't have to use the self prefix?

=begin
self is referencing the setter method provided by attr_accessor :age
so instead of referencing the setter method we could just reference the @age instance variable directly
=end
