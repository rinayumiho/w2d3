class HumanPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(pos_arr)
        puts "now it is turn for " + @mark_value.to_s
        puts "please enter your position (two numbers seperate by a space)"
        pos = gets.chomp
        while legal_input(pos, pos_arr) == -1
            puts "invalid input, try it again"
            pos = gets.chomp
        end
        res = pos_arr[legal_input(pos, pos_arr)]
        puts "your input is:"
        puts res.join(" ")
        res
    end

    def legal_input(str, pos_arr)
        arr = str.split
        return -1 if arr.length != 2 || arr[0].length > 1 || arr[1].length > 1 || !("0".."9").include?(arr[0]) || !("0".."9").include?(arr[1])
        arr.map! { |ele| ele.to_i }
        (0...pos_arr.length).each { |i| return i if pos_arr[i][0] == arr[0] && pos_arr[i][1] == arr[1] }
        -1
    end
end