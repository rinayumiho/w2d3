class Code

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.key?(ele.upcase) }
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs =  arr.map { |ch| ch.upcase }
    else
      raise "not valid pegs"
    end
  end

  def self.random(len)
    Code.new(Array.new(len) {POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    @pegs.each.with_index.inject(0) do |acc, (ele, idx)|
      if ele == code.pegs[idx]
        acc += 1
      else
        acc
      end
    end
  end

  def num_near_matches(code)
    not_matched = (0...@pegs.length).reject { |idx| @pegs[idx] == code.pegs[idx] }
    hash = Hash.new(0)
    not_matched.each { |idx| hash[@pegs[idx]] += 1 }
    ct = 0
    not_matched.each do |idx|
      hash[code.pegs[idx]] -= 1
      ct += 1 if hash[code.pegs[idx]] > -1
    end
    ct
  end

  def ==(code)
    return false if code.pegs.length != @pegs.length || (0...@pegs.length).any? { |idx| @pegs[idx] != code.pegs[idx] }
    true
  end

end
