require_relative "board"
require_relative "humanPlayer"
require_relative "computerPlayer"

class Game
    def initialize(n, players)
        @board = Board.new(n)
        @players = []
        players.each do |k, v|
            if v
                @players << ComputerPlayer.new(k)
            else
                @players << HumanPlayer.new(k)
            end
        end
        @current = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current = @players[0]
    end

    def play
        while !@board.empty_positions?
            @board.print
            pos = @current.get_position(@board.legal_positions)
            @board.place_mark(pos, @current.mark_value)
            if @board.win?
                @board.print
                puts @current.mark_value.to_s + " win"
                return
            end
            switch_turn
        end
        puts "draw"
    end
end