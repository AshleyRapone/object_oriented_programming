class Game
  def play
    "Start the game!"
  end
end

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

=begin
We can add the < Game to the Bingo class and that will allow it to inherit the play method from the
Game class because the Game class now acts as the superclass
=end
