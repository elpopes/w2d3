require_relative "board"
require_relative "player"
require_relative "game"
require_relative "computer"
require 'byebug'

class Game

    def initialize(size, player_hash)
        @board = Board.new(size)
        @play_array = []
        # debugger
        player_hash.each {|mark, comp| comp ? @play_array << Computer.new(mark) : @play_array << Player.new(mark) }
        @current_player = @play_array[0]
    end

    def switch_turn
        @play_array.rotate!
        @current_player = @play_array[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            mark = @current_player.mark
            @board.place_mark(@current_player.get_position(@board.legal_positions), mark)
            if @board.win?(mark) 
                return winner(mark)
            else
                switch_turn
            end
        end
        @board.print
        puts "There are no winner today, just losers."
    end

    def winner(mark)
        @board.print
        puts "#{mark} has won the game!" 
    end

end

game = Game.new(4, X: true, Y: true, Z: true)
game.play