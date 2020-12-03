class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input_num = input.to_i - 1
    end

    def move(input, token = "X")
        @board[input] = token
    end

    def position_taken?(input)
        if @board[input] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(input)
        if (0..8).include?(input) && !position_taken?(input)
            return true
        end
        return false
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}

    end

    def current_player
        #use #turn_count to determine if it's X or O's turn
        if turn_count.odd?
            return "O"
        end
            return "X"
    end

    def turn
        input = gets.strip
        index = input_to_index(input)
        token = current_player
        if !valid_move?(index)
            gets.strip
        else
            move(index, token)
            display_board
        end
    end

    def won?
        WIN_COMBINATIONS.collect do |combo|
            if combo.all? {|space| @board[space] == "X"}
                return combo
            elsif combo.all? {|space| @board[space] == "O"}
                return combo
            end
        end
        return false
    end

    def full?
        if @board.all? {|space| space == "X" || space == "O"}
            return true
        end
    end

    def draw?
        full? == true && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if won?
            @board[won?[0]]
        elsif draw?
            return false

        end
    end

    def play
        until over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end

    end

end

