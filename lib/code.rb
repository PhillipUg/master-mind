class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.map!(&:upcase) if array.all?(&:downcase)
    array.all? {|char| POSSIBLE_PEGS.keys.include?(char)}
  end

  def initialize(array)
    Code.valid_pegs?(array) ? @pegs = array.map(&:upcase) : raise("error, pegs invalid")
  end

  def self.random(length)
    new_code = Code.new(Array.new(length, POSSIBLE_PEGS.keys[rand(length)]))
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.size
  end

  def num_exact_matches(guess)
   counter = 0
   (0...guess.pegs.size).each do |i|
      if guess.pegs[i] == @pegs[i]
        counter += 1
      end
   end
   counter
  end

  def num_near_matches(guess)
    counter = 0
   (0...guess.pegs.size).each do |i|
      if guess.pegs[i] != @pegs[i] && @pegs.include?(guess.pegs[i])
        counter += 1
      end
   end
   counter
  end

  def ==(other_code)
    @pegs.eql?(other_code.pegs)
  end
end