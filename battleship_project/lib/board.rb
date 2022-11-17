class Board
    attr_reader :size, :max_height, :ship_limit
    def initialize(n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n*n  
        @max_height = n
        @ship_limit = @size * 1/4
    end

    def self.print_grid(grid)
        grid.each {|row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print 
        Board.print_grid(hidden_ships_grid)
    end

    def place_random_ships
        while num_ships < @ship_limit
            row = rand(0...@max_height)
            col = rand(0...@max_height)
            @grid[row][col] = :S
        end
    end

    def hidden_ships_grid
        hidden_ships = @grid.map {|row| row.map {|ele| ele == :S ? ele = :N : ele = ele}}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def num_ships
        @grid.flatten.count {|pos| pos == :S}
    end



    def attack(pos)
        if self[pos] == :S
            self[pos]=("\e[31m#{:H}\e[0m")
            p 'you sunk my battleship!'
        else
            self[pos]=("\e[34m#{:X}\e[0m")
            return false
        end
        true
    end

    






end
