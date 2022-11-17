class Player
    attr_reader :mark
    def initialize(mark)
        @mark = mark        
    end

    def get_position(legal_positions)
        puts "It's #{@mark}'s turn."
        puts "Please enter a row and a column like this: '0 2'"
        begin
            pos = prompt_pos(legal_positions)
        rescue
            puts "#{@mark} must enter two numbers, seperated by a space from the following array:"
            p legal_positions
            retry
        end
        p pos
    end

    def prompt_pos(legal_positions)
        pos = gets.chomp.split(" ").map(&:to_i).to_a
        unless legal_positions.include?(pos)
            raise 
        end
        pos
    end
end