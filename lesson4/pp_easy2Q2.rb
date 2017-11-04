class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

=begin
-The new class method is called on the RoadTrip class which creates a new instance
of the class RoadTrip which is then stored in the variable trip
-The predict_the_future method is called on the trip object
-Since there is no predict_the_future method in the RoadTrip class Ruby will look
for a predict_the_future method in superclass Oracle and invoke the method if found
-Inside the predict_the_future method
  -the choices method is called and an array of strings is returned
  ["visit Vegas", "fly to Fiji", "romp in Rome"]
  -the sample method is called on the array and returns a random string from the array
  -The string "You will" is concatenated with the return value of choices.sample

** the choices method in the RoadTrip class was returned even though the predict_the_future
method was in the Oracle class is because we called the predict_the_future method on the
instance of the RoadTrip class so every time Ruby tries to find a method name it will start with
the methods defined on the class you are calling and since there was a method named choices
in the RoadTrip class it was executed
=end
