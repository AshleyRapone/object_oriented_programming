# This is a tic-tac-toe game with added bonus features!
# The bonus features are:
# -Player can pick either X or O marker
# -Player can pick whether player or computer goes first
# -The score keeps track of who won until player or computer reaches 5 wins
# -The computer will always pick the middle square first unless it is taken
# -The computer has AI offense and picks the square that will let computer win
# -The computer has AI defense and will pick the square so player cant win

# Displayable module
module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First person to win 5 games wins!"
    puts ""
  end

  def display_board
    puts "#{human.name} is a #{human.marker}."
    puts "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
      "Player"
    when computer.marker
      puts "#{computer.name} won!"
      "Computer"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    score
    puts "#{human.name}'s score is: #{@human_score}"
    puts "#{computer.name}'s score is: #{@computer_score}"
  end

  def display_result_and_score
    display_result
    display_score
  end

  def display_grand_winner
    if @human_score > @computer_score
      puts "#{human.name} is the grand winner!"
    elsif @human_score < @computer_score
      puts "The #{computer.name} is the grand winner!"
    end
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

# Board class
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def threat_detected(human_marker)
    WINNING_LINES.each do |line|
      return line.select { |num| @squares[num].to_s == ' ' } if
      @squares.values_at(*line).map(&:marker).count(human_marker) == 2 &&
      @squares.values_at(*line).map(&:marker).count(' ') == 1
    end
    nil
  end

  def computer_can_win(computer_marker)
    WINNING_LINES.each do |line|
      return line.select { |num| @squares[num].to_s == ' ' } if
      @squares.values_at(*line).map(&:marker).count(computer_marker) == 2 &&
      @squares.values_at(*line).map(&:marker).count(' ') == 1
    end
    nil
  end

  def middle_square_open?
    @squares[5].to_s == Square::INITIAL_MARKER
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

# Square class
class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

# Player superclass
class Player
  attr_reader :marker, :name

  def initialize
    set_name
  end
end

# Human subclass
class Human < Player
  def initialize
    super
    set_marker
  end

  def set_name
    answer = ''
    loop do
      puts "What is your name?!?"
      answer = gets.chomp.upcase
      break unless answer.empty?
      puts "Please input a name!"
    end
    @name = answer
  end

  def set_marker
    answer = ''
    loop do
      puts "Would you like to be 'X' or '0'?"
      answer = gets.chomp
      break if answer == 'X' || answer == 'O'
      puts "Please type 'X' or 'O'"
    end
    @marker = answer
    $human_marker = answer
  end
end

# Computer subclass
class Computer < Player
  NAMES = ['R2D2', 'Hal', 'Sonny', 'Number 5', 'Chappie']

  def initialize
    super
    set_marker
  end

  def set_name
    @name = NAMES.sample
  end

  def set_marker
    if $human_marker == 'X'
      $computer_marker = 'O'
      @marker = 'O'
    elsif $human_marker == 'O'
      @marker = 'X'
      $computer_marker = 'X'
    end
  end
end

# TTTGame class
class TTTGame
  include Displayable

  attr_reader :board, :human, :computer, :marker

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear
    display_welcome_message
    go_first?

    loop do
      reset_scores
      loop do
        display_board

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
        end
        display_result_and_score
        reset
        break if @human_score == 5 || @computer_score == 5
      end
      display_play_again_message
      display_grand_winner
      break unless play_again?
    end

    display_goodbye_message
  end

  def clear
    system 'clear'
  end

  def go_first?
    answer = ''
    loop do
      puts "Do you want to go first?"
      puts "Type 'yes' or 'no'"
      answer = gets.chomp.downcase
      break if ['yes', 'no'].include?(answer)
      puts "Please type yes or no!"
    end
    if answer == 'yes'
      @current_marker = human.marker
    elsif answer == 'no'
      @current_marker = computer.marker
    end
    $first_to_move = @current_marker
  end

  def reset_scores
    @human_score = 0
    @computer_score = 0
  end

  def current_player_moves
    if @current_marker == @human.marker
      human_moves
      @current_marker = @computer.marker
    else
      computer_moves
      @current_marker = @human.marker
    end
  end

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    if !!board.computer_can_win(@computer.marker)
      board[board.computer_can_win(@computer.marker)[0]] = computer.marker
    elsif !!board.threat_detected(@human.marker)
      board[board.threat_detected(@human.marker)[0]] = computer.marker
    elsif board.middle_square_open?
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def reset
    board.reset
    @current_marker = $first_to_move
    clear
  end

  def score
    if display_result == "Player"
      @human_score += 1
    elsif display_result == "Computer"
      @computer_score += 1
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w[y n].include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end
end

game = TTTGame.new
game.play
