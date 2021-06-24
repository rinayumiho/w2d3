require_relative "code"

class Mastermind
  def initialize(len)
    @secret_code = Code.random(len)
  end

  def print_matches(code)
    puts @secret_code.num_exact_matches(code)
    puts @secret_code.num_near_matches(code)
  end

  def ask_user_for_guess
    puts "Enter a code"
    code = Code.from_string(gets.chomp)
    print_matches(code)
    @secret_code == code
  end
end
