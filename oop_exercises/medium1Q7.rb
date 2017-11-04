class GuessingGame
  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize(low, high)
    @range = low..high
    @max_guesses = Math.log2(high - low + 1).to_i + 1
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(@range)
  end

  def play_game
    result = nil
    @max_guesses.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      return guess if @range.cover?(guess)
      print "Invalid guess. "
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end


game = GuessingGame.new(501, 1500)
game.play

You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too high

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
You win!

game.play
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low

You have 1 guesses remaining.
Enter a number between 501 and 1500: 837
Your guess is too low

You are out of guesses. You lose.
