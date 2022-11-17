require "byebug"
class Board 
    attr_reader :grid, :limit
    def initialize(n=3)
        @grid = Array.new(n){Array.new(n, "___")}
        @limit = n - 1
    end

    def print
        system("clear")
        p "____TIC_TAC_TOE______"
        @grid.each {|row| puts "     #{row.join(" ")}"}
        p "*********************"
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
        # debugger
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def valid?(pos)
        within_range?(pos) && empty?(pos)
    end

    def within_range?(pos)
        row, col = pos
        row.between?(0, @limit) && col.between?(0, @limit)
    end

    def empty?(pos)
        # debugger
        self[pos] == "___"
    end

    def place_mark(pos, mark)
         valid?(pos) ? self[pos]="_#{mark}_" : false
    end

    def win_row?(mark)
        # debugger
        @grid.any? {|row| row.all? {|ele| ele.include?("#{mark}")}}
    end

    def win_col?(mark)
        @grid.transpose.any? {|row| row.all? {|ele| ele.include?("#{mark}")}}
    end

    def win_diag?(mark)
        @limit < (0..@limit).count {|i| @grid[i][i].include?("#{mark}")} || 
        @limit < (0..@limit).count {|i| @grid[i][@limit - i].include?("#{mark}")}
    end

    def win?(mark)
        win_row?(mark) || win_diag?(mark)  || win_col?(mark)
    end

    def empty_positions?
        @grid.any? {|row| row.any? {|ele| ele == "___"}}
    end

end


# def fill(x)
#     b = Board.new
#     b.print
#     p b.empty_positions?
#     (0..2).each {|i| (0..2).each {|j| b.place_mark([i, j], x)}}
#     b.print
#     p b.empty_positions?
# end

# fill(:X)


# b = Board.new
# puts "this is the #{b}"
# pos = 0,0
# b.place_mark(pos, :X)
# pos = 1,1
# b.place_mark(pos, :X)
# pos = 2,2
# b.place_mark(pos, :X)
# p b.win?(:X)

# b = Board.new
# puts "this is the #{b}"
# pos = 0,0
# b.place_mark(pos, :X)
# pos = 0,1
# b.place_mark(pos, :X)
# pos = 0,2
# b.place_mark(pos, :X)
# p b.win?(:X)

# b = Board.new
# puts "this is the #{b}"
# pos = 0,0
# b.place_mark(pos, :X)
# pos = 0,1
# b.place_mark(pos, :X)
# pos = 0,2
# b.place_mark(pos, :X)
# p b.win?(:X)

# b = Board.new
# puts "this is the #{b}"
# pos = 0,0
# b.place_mark(pos, :X)
# pos = 0,1
# b.place_mark(pos, :X)
# pos = 0,3
# b.place_mark(pos, :X)
# p b.win?(:X)