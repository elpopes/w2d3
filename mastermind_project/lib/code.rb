class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  
  def initialize(arr_char)
    if Code.valid_pegs?(arr_char)
      @pegs = arr_char.map(&:upcase)
    else
      raise "valid pegs please"
    end
  end
  
  def self.valid_pegs?(arr_char)
    arr_char.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    array = []
    until array.length == length
      array << POSSIBLE_PEGS.keys.sample
    end
    Code.new(array)
  end

  def self.from_string(peg_string)
    Code.new(peg_string.upcase.split("")) 
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    counter = 0
    guess.pegs.each_with_index {|peg, i| counter += 1 if @pegs[i] == peg}
    counter
  end

  def num_near_matches(guess)
    counter_hash = Hash.new(0)
    counter = 0

    @pegs.each {|peg| counter_hash[peg] += 1}

    (0...guess.length).each {|i| counter_hash[@pegs[i]] -= 1 if guess[i] == @pegs[i]}
    
    (0...guess.length).each do |i| 
      if guess[i] != @pegs[i] && counter_hash[guess[i]] > 0
        counter += 1
        counter_hash[guess[i]] -= 1
      end
    end
    
    counter
  end

  def ==(code)
    @pegs == code.pegs
  end

end
