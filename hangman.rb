class Hangman
  attr_reader :guesses_left, :guessed_letters

  def initialize(word)
    @word = word.downcase
    @guesses_left = 6
    @guessed_letters = []
    @hidden_word = "_" * @word.length
  end

  def play
    until game_over?
      display_board
      guess = ask_for_guess
      update_game_state(guess)
    end
    display_result
  end

  private

  def display_board
    puts "Guesses left: #{@guesses_left}"
    puts "Guessed letters: #{@guessed_letters.join(', ')}"
    puts "Word: #{@hidden_word}"
  end

  def ask_for_guess
    print "Enter your guess: "
    gets.chomp.downcase
  end

  def update_game_state(guess)
    if @word.include?(guess)
      @word.split('').each_with_index do |letter, index|
        @hidden_word[index] = letter if letter == guess
      end
    else
      @guesses_left -= 1
    end
    @guessed_letters << guess
  end

  def game_over?
    @guesses_left.zero? || !@hidden_word.include?('_')
  end

  def display_result
    if @hidden_word.include?('_')
      puts "You lose! The word was #{@word}."
    else
      puts "You win! The word was #{@word}."
    end
  end
end
