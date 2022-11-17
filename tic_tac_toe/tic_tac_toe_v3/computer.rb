class Computer
    attr_reader :mark
    def initialize(mark)
        @mark = mark        
    end

    def get_position(legal_positions)
        sleep 1
        pos = legal_positions.sample
        puts "Computer #{@mark} choose #{pos}"
        pos
    end
end