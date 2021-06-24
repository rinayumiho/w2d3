require_relative "board"
require_relative "humanPlayer"

class Game
    def initialize(p1_mark, p2_mark)
        @p1 = HumanPlayer.new(p1_mark)
        @p2 = HumanPlayer.new(p2_mark)
        @current = @p1
        @grid = Board.new
    end

    def switch_turn
        if @current == @p1
            @current = @p2
        else
            @current = @p1
        end
    end

    def play
        while !@grid.empty_positions?
            @grid.print
            pos = @current.get_position
            @grid.place_mark(pos, @current.mark_value)
            if @grid.win?
                puts @current.mark_value.to_s + " win"
                return
            end
            switch_turn
        end
        puts "draw"
    end
end