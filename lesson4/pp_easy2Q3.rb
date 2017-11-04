# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?
# What is the lookup chain for Orange and HotSauce?
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

=begin
-The method lookup path is where Ruby will look for a method starting in the first
class in the chain and keeps looking up methods until it finds the method or it displays
a NoMethodError
-You can find an object's ancestors by calling the ancestors method on the object's class
=end

puts Orange.ancestors
=begin
Lookup path for Orange class:
-Orange
-Taste
-Object
-Kernel
-BasicObject
=end
puts HotSauce.ancestors
=begin
Lookup path for HotSauce class:
-HotSauce
-Taste
-Object
-Kernel
-BasicObject
=end
