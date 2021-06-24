class Board

    def initialize(n)
        @len = n
        @grid = Array.new(n) { Array.new(n, "_") }
        @remains = n * n
    end

    # def valid?(pos)
    #     i, j = pos[0], pos[1]
    #     i > -1 && i < @len && j > -1 && j < @len
    # end

    # def empty?(pos)
    #     i, j = pos[0], pos[1]
    #     @grid[i][j] == "_"
    # end

    # def place_mark(pos, mark)
    #     if valid?(pos) && empty?(pos)
    #         i, j = pos[0], pos[1]
    #         @grid[i][j] = mark
    #         @remains -= 1
    #     else
    #         raise "not valid or empty position"
    #     end
    # end

    def place_mark(pos, mark)
        i, j = pos[0], pos[1]
        @grid[i][j] = mark
        @remains -= 1
    end

    def print
        @grid.each { |arr| puts arr.join(" ") }
    end

    def win_row?
        @grid.any? { |arr| (1...@len).all? { |i| arr[0] == arr[i] && arr[0] != "_" } }
    end

    def win_col?
        (0...@len).any? { |j| (1...@len).all? { |i| @grid[0][j] == @grid[i][j] && @grid[0][j] != "_" } }
    end

    def win_diagonal?
        (1...@len).all? { |i| @grid[0][0] == @grid[i][i] && @grid[i][i] != "_" } || (1...@len).all? { |i| @grid[0][@len - 1] == @grid[i][@len - 1 - i] && @grid[0][@len - 1] != "_" }
    end

    def win?
        win_row? || win_col? || win_diagonal?
    end

    def empty_positions?
        @remains == 0
    end

    def legal_positions
        res = []
        (0...@len).each do |i|
            (0...@len).each do |j|
                res << [i, j] if @grid[i][j] == "_"
            end
        end
        res
    end
end