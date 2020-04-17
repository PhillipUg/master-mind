class Code
  attr_reader :letters

  POSSIBLE_LETTERS = %w( A B C D)
  
  def initialize(array)
    Code.valid_letters?(array) ? @letters = array.map(&:upcase) : raise("error, letters invalid")
  end

  def self.valid_letters?(array)
    array.map!(&:upcase) if array.all?(&:downcase)
    array.all? {|char| POSSIBLE_LETTERS.include?(char)}
  end

  def self.random(length)
    random_letters = []
    length.times {random_letters << POSSIBLE_LETTERS.sample}
    Code.new(random_letters)
  end

  def self.from_string(letters)
    Code.new(letters.split(""))
  end

  def [](index)
    @letters[index]
  end

  def length
    @letters.size
  end

  def num_exact_matches(guess)
   counter = 0
   (0...guess.letters.size).each do |i|
      if guess.letters[i] == @letters[i]
        counter += 1
      end
   end
   counter
  end

  def num_near_matches(guess)
    counter = 0
   (0...guess.letters.size).each do |i|
      if guess.letters[i] != @letters[i] && @letters.include?(guess.letters[i])
        counter += 1
      end
   end
   counter
  end

  def ==(other_code)
    @letters.eql?(other_code.letters)
  end

end