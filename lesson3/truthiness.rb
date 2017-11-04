# 1.
if true
  puts 'hi'
else
  puts 'goodbye'
end

# puts 'hi' is executed because the if conditional evaluated to true

# 2.
if false
  puts 'hi'
else
  puts 'goodbye'
end

# puts 'goodbye' is executed because the if conditional evaluated to false so the
# else statement was executed

# 3.
num = 5

if (num < 10)
  puts "small number"
else
  puts "large number"
end

# puts "small number" is executed becasue the expression num < 10 evaluates to true

# 4.
puts "it's true!" if some_method_call

# puts "it's true!" is executed if the some_method_call method returns true

# 5.
num = 5

if num
  puts "valid number"
else
  puts "error!"
end

# puts "valid number" if executed becasue num points to an integer and Ruby considers
# integers to be "truthy"

# 6.
if name = find_name
  puts "got a name"
else
  puts "couldn't find it"
end

# if it returns a valid object then puts "got a name" will be returned unless it
# returns nil or false then puts "couldn't find it" will be executed
# writing code like this is dangerous becasue it people might think that you meant
# to use the equality operator == instead of the assignment operator =

# 7.
name = find_name

if name && name.valid?
  puts "geat name!"
else
  puts "either couldn't find name or it's invalid"
end

# if name points to nil then name.valid? will not be executed becasue nil is considered
# "falsey" and && short circuits when false is encountered
