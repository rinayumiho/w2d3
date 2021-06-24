class Board

    def initialize
        @board = Array.new(3) { Array.new(3, "_") }
        @remains = 9
    end

    def valid?(pos)
        i, j = pos[0], pos[1]
        i > -1 && i < 3 && j > -1 && j < 3
    end

    def empty?(pos)
        i, j = pos[0], pos[1]
        @board[i][j] == "_"
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            i, j = pos[0], pos[1]
            @board[i][j] = mark
            @remains -= 1
        else
            raise "not valid or empty position"
        end
    end

    def print
        @board.each { |arr| puts arr.join(" ") }
    end

    def win_row?
        @board.any? { |arr| (1..2).all? { |i| arr[0] == arr[i] && arr[0] != "_" } }
    end

    def win_col?
        (0..2).any? { |j| (1..2).all? { |i| @board[0][j] == @board[i][j] && @board[0][j] != "_" } }
    end

    def win_diagonal?
        (1..2).all? { |i| @board[0][0] == @board[i][i] && @board[i][i] != "_" } || (1..2).all? { |i| @board[0][2] == @board[i][2 - i] && @board[0][2] != "_" }
    end

    def win?
        win_row? || win_col? || win_diagonal?
    end

    def empty_positions?
        @remains == 0
    end
end