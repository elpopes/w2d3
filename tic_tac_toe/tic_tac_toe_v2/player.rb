class Player
    attr_reader :mark
    def initialize(mark)
        @mark = mark        
    end

    def get_position
        puts "It's #{@mark}'s turn."
        puts "Please enter a row and a column like this: '0 2'"
        begin
            pos = prompt_pos
        rescue
            puts "#{@mark} must enter two numbers, seperated by a space, between 0 and the size of the board, exclusive"
            retry
        end
        p pos
    end

    def prompt_pos
        pos = gets.chomp.split(" ").map(&:to_i).to_a
        unless pos[0].is_a?(Integer) && pos[1].is_a?(Integer)
            raise 
        end
        pos
    end
end