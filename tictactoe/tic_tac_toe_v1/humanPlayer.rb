class HumanPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "now it is turn for " + @mark_value.to_s
        puts "please enter your position (two numbers seperate by a space)"
        arr = gets.chomp.split
        if arr.length != 2 || arr[0].length > 1 || arr[1].length > 1 || !("0".."9").include?(arr[0]) || !("0".."9").include?(arr[1])
            raise "not valid input"
        end
        arr.map! { |ele| ele.to_i }
        puts "your input is:"
        puts arr.join(" ")
        arr
    end
end