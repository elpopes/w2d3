require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    
    def initialize(height)
        @player = Player.new
        @board = Board.new(height)
        @remaining_misses = @board.size * 1/2
    end

    def start_game
        @board.place_random_ships
        p "there are #{@board.num_ships} ships out there"
        puts "___________________________________________"
        @board.print
    end

    def loser
        puts "you lose"
        true
    end

    def lose?
        return @remaining_misses <= 0 ? loser : false
    end

    def winner
        puts 'you win'
        true
    end

    def win?
        @board.num_ships == 0 ? winner : false
    end

    def game_over?
        win? || lose?
    end

    def turn
        @remaining_misses -= 1 unless @board.attack(@player.get_move)
        @board.print
        puts "you have #{@remaining_misses} torpedos left"
    end
        
end
