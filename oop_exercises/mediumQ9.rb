class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.
