require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "exact matches: #{@secret_code.num_exact_matches(code)}"
    puts "near matches: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    answer = gets.chomp
    guess = Code.from_string(answer)
    self.print_matches(guess)
    @secret_code == guess 
  end
end
