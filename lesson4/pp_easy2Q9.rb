# What would happen if we added a play method to the Bingo class, keeping in mind
# that there is already a method of this name in the Game class that the Bingo class inherits from.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin
If we added a play method in the Bingo class then when the rules_of_play method is
called on objects from the Bingo class Ruby will execute the play method in the Bingo
class instead of looking up the chain in the Game superclass
=end
