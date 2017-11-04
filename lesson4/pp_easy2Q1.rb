class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
puts oracle.predict_the_future

=begin
-The new class method is called on the Oracle class which creates a new instance of
the class Oracle which is stored in the variable oracle
-The predict_the_future method is called on the oracle object and the predict_the_future
method of the Oracle class is invoked
-Inside the predict_the_future method:
  -the choices method is called and returns an array of strings
  -the sample method is called on the return value of the choices method and returns
  a random string of the array
  -the return value of the sample method is concatenated with the string "You will"
=end
