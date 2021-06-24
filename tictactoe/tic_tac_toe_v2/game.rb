require_relative "board"
require_relative "humanPlayer"

class Game
    def initialize(n, *players)
        @board = Board.new(n)
        @players = players.map { |p| HumanPlayer.new(p) }
        @current = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current = @players[0]
    end

    def play
        while !@board.empty_positions?
            @board.print
            pos = @current.get_position
            @board.place_mark(pos, @current.mark_value)
            if @board.win?
                puts @current.mark_value.to_s + " win"
                return
            end
            switch_turn
        end
        puts "draw"
    end
end