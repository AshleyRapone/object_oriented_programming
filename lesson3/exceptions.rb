# 1.
begin
  # put code at risk of failing here
rescue TypeError
  # take action
end

=begin
If code onn line 2 raises a TypeError then the code under the rescue clause will be
executed instead of the program exiting
=end

# 2.
begin
  # some code at risk of failing
rescue TypeError
  # take action
rescue ArgumentError
  # take a different action
end
# Can include mulitple rescue clausses to handle different types of exceptions that may occur

# 3.
begin
  # some code at risk of failign
rescue ZeroDivisionError, TypeError
  # take action
end
# Can use this syntax if you want to add the same action for more that one type of exception

# 4.
rescue TypeError => e

=begin
Any TypeError will be rescued and the exception will be stored in e
=end

# 5.
begin
  # code at risk of failing here
rescue StandardError => e
  puts e.message
end
=begin
Any type of StandardError exception will be rescued and a message associated with
the exception objecte will be outputted
=end

# 6.
file = open(file_name, 'W')

begin
  # do something with file
rescue
  # handle exception
rescue
  # handle a different exception
ensure
  file.close
  # executes every time
end

=begin
Whether or not an exception was raised when working with the file, this code ensures
that it will always be closed
=end

# 7.
RETRY_LIMIT = 5

begin
  attempts = attempts || 0
  # do something
rescue
  attempts += 1
  retry if attempts < RETRY_LIMIT
end
=begin
We want to keep executing the code that raissed an exception until the attempts
equal the RETRY_LIMIT
=end

# 8.
raise TypeError.new("Something went wrong!")
raise TypeError, "Something went wrong!"
# different syntax options to use when working with raise

# 9.
def validate_age(age)
  raise("invalid age") unless (0..105).include?(age)
end

begin
  validate_age(age)
rescue RuntimeError => e
  puts e.message  # => invalid age
end
# If an invalid age is passed int to the method a RuntimeError with the error message
# "invalid age" will be raised and the rescue clause of begin/rescue block will be
# executed

# 10.
class ValidateAgeError < StandardError; end

def validate_age(age)
  raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
end

begin
  validate_age(age)
rescue ValidateAgeError => e
  # take action
end
=begin
The ValidateAgeError class is inheriting from the StandardError class
=end
