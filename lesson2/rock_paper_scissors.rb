# This is a rock paper scissors game with bonus features!

# The bonus features are:
# -keeping track of the player's and computer's scores
# -giving you the option to pick Lizard or Spock as a move!
# -keeps track of the player's and computers' moves history
# -Play against 5 posssible computer characters each with their own personality!
# -Some of the computer personalities will adjust their choice based on history

# Contains methods that output information
module Displayable
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first person to win 10 games wins!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_score
    score
    puts "#{human.name}'s score is: #{human_score}"
    puts "#{computer.name}'s score is: #{computer_score}"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      @history[:player][1] << 'won'
      @history[:computer][1] << 'lost'
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      @history[:player][1] << 'lost'
      @history[:computer][1] << 'won'
    else
      puts "It's a tie!"
    end
  end

  def display_players_history
    puts "---------------------------------------------------------------------"
    puts "#{human.name}'s past moves are: #{@history[:player][0].join(', ')}"
    puts "#{computer.name}'s past moves are: #{@history[:computer][0].join(', ')}"
    puts "---------------------------------------------------------------------"
  end
end

# Move superclass
class Move
  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def to_s
    @value
  end
end

# Classes for each type of Move
class Rock < Move
  def initialize
    @value = 'rock'
  end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.scissors? || other_move.lizard?
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock?
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end

  def >(other_move)
    other_move.paper? || other_move.spock?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end

  def >(other_move)
    other_move.rock? || other_move.scissors?
  end

  def <(other_move)
    other_move.paper? || other_move.lizard?
  end
end

# Player superclass
class Player
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  attr_accessor :move, :name, :history

  def initialize
    set_name
  end

  def which_move?(choice)
    case choice
    when 'rock' then self.move = Rock.new
    when 'paper' then self.move = Paper.new
    when 'scissors' then self.move = Scissors.new
    when 'lizard' then self.move = Lizard.new
    when 'spock' then self.move = Spock.new
    end
  end
end

# Classes of the two different type of players we can have
class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    which_move?(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Chappie', 'Sonny', 'Number 5', 'Hal'].sample
  end

  def choose(opt1=player_history, opt2=computer_history)
    case name
    when 'R2D2' then r2d2
    when 'Chappie' then chappie(opt1)
    when 'Hal' then hal
    when 'Sonny' then sonny
    when 'Number 5' then number_5(opt2)
    end
  end

  # always plays rock
  def r2d2
    choice = 'rock'
    which_move?(choice)
  end

  # never plays paper
  def sonny
    choice = ''
    loop do
      choice = VALUES.sample
      break unless choice == 'paper'
    end
    which_move?(choice)
  end

  # always chooses what the player picked last
  def chappie(opt1=player_history)
    if opt1[0].size < 2
      choice = VALUES.sample
      which_move?(choice)
    elsif opt1[0].size >= 2
      choice = opt1[0][-2].to_s
      which_move?(choice)
    end
  end

  # Picks a random piece
  def hal
    choice = VALUES.sample
    which_move?(choice)
  end

  # if computer wins then it will keep playing that piece until it loses
  def number_5(opt2=computer_history)
    if opt2[0].size.empty? || opt2[1][-1] == 'lost'
      choice = VALUES.sample
      which_move?(choice)
    elsif opt2[1][-1] == 'won'
      choice = opt2[0][-1].to_s
      which_move?(choice)
    end
  end
end

# Score class
class Score
  include Displayable

  attr_accessor :human, :computer, :human_score, :computer_score

  def initialize(human, computer)
    @human = human
    @computer = computer
    @human_score = 0
    @computer_score = 0
  end

  def score
    if human.move > computer.move
      @human_score += 1
    elsif human.move < computer.move
      @computer_score += 1
    end
  end

  def game_over?
    human_score == 10 || computer_score == 10
  end

  def winner
    if human_score > computer_score
      @winner = human.name
    elsif human_score < computer_score
      @winner = computer.name
    end
  end
end

# Game Orchestration Engine
class RPSGame
  include Displayable

  attr_accessor :human, :computer, :score, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = { player: [[], []], computer: [[], []] }
  end

  def players_choose
    @history[:player][0] << human.choose

    @history[:computer][0] << computer.choose(@history[:player], @history[:computer])
  end

  def play_again?
    puts "The grand-winner is: #{score.winner}!"
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      @score = Score.new(human, computer)
      loop do
        players_choose
        display_moves
        display_winner
        score.display_score
        display_players_history
        break if score.game_over?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
