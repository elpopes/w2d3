require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        puts "Number of exact matches: #{@secret_code.num_exact_matches(guess)}"
        puts "Number of near matches: #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess = gets.chomp
        guess = Code.from_string(guess)
        print_matches(guess)
        @secret_code == guess
    end
end
