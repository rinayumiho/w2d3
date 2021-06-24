class ComputerPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(pos_arr)
        puts "now it is turn for Computer Player"
        arr = pos_arr[rand(pos_arr.length)]
        puts "Computer Player's input is:"
        puts arr.join(" ")
        arr
    end
end