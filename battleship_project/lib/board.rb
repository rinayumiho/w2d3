class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, val)
        @grid[arr[0]][arr[1]] = val
    end

    def num_ships
       @grid.inject(0) { |acc, ele| acc + ele.count(:S) } 
    end

    def attack(arr)
        if self[arr] == :S
            self[arr] = :H
            puts "you sunk my battleship!"
            return true
        end
        self[arr] = :X
        false
    end

    def place_random_ships
        ct = (@size * 0.25).to_i
        arr = (0...@size).to_a.sample(ct)
        arr.each do |id|
            i = id / @grid.length
            j = id % @grid.length
            self[[i, j]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |arr|
            arr.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(arr)
        arr.each do |tmp|
            puts tmp.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
