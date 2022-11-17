require_relative "board"
require_relative "player"


class Game
    def initialize(p1_mark, p2_mark, size)
        @board = Board.new(size)
        @player_1, @player_2 = Player.new(p1_mark), Player.new(p2_mark)
        @current_player = @player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            mark = @current_player.mark
            @board.place_mark(@current_player.get_position, mark)
            if @board.win?(mark) 
                return winner(mark)
            else
                switch_turn
            end
        end
        puts "There are no winner today, just losers."
    end

    def winner(mark)
        @board.print
        puts "#{mark} has won the game!" 
    end

end

g = Game.new(:X, :O, 5)
g.play