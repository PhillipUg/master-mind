require_relative "code"



class Mastermind
  attr_reader :num_of_guesses, :secret_code

  def initialize(length)
    @letters = %w(A B C D)
    @length = length
    @secret_code = Code.random(length)
    @sample = Array.new(@length, @letters.sample)
    @num_of_guesses = 0
  end

  def print_matches(code)
    puts "exact matches: #{@secret_code.num_exact_matches(code)}"
    puts "near matches: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    print "Enter a pattern of #{@length} letters (e.g '#{@sample.join}'): "
    answer = gets.chomp
    guess = Code.from_string(answer)
    self.print_matches(guess)
    @num_of_guesses += 1
    @secret_code == guess
  end

end
