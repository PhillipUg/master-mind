require_relative "mastermind"


puts "In this game, you can only choose from these letters: => 'A', 'B', 'C', 'D'"
puts "----------------------"
puts "In the begining you decide the size of pattern of letters to guess from, whether you want to guess just 1  or 2 letters or a million (have your pick)"
puts "----------------------"
puts "To play, enter a pattern of letters e.g. if you input '3' as the size of pattern, then you either enter: 'AbC' or 'CDB' or 'BdB' the capitalization of the letters doesn't matter"
puts "*************************************"
puts "Let's Begin..."
puts "*************************************"
puts
puts
print "Enter a size for the pattern of letters (e.g '3', '5' or even '10'): "
mastermind = Mastermind.new(gets.chomp.to_i)

until (mastermind.ask_user_for_guess) do
  puts "-------------------------"
end

puts
puts "**** You win! ****"
puts
puts "Game completed in [#{mastermind.num_of_guesses}] round(s)"
puts
