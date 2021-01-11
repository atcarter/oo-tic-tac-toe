class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,4,8], # Diagonal from top left
        [2,4,6], # Diagonal from top right
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8]  # Right column
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        num = string.to_i - 1
        num
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if index < 9 && index > -1 && @board[index] == " "
            true
        else
            false
        end
    end

    def turn_count
        i = 0
        @board.each do |position|
            if position == "X" || position == "O"
                i += 1
            else
                i += 0
            end
        end

        i
    end

    def current_player
        if turn_count % 2 == 0
            string = "X"
        else
            string = "O"
        end
        string
    end
    
    def turn
        puts "Type a number 1-9 for the board position: "
        num = gets.strip
        index = input_to_index(num)
        
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            puts "Please enter the input again"
            turn
        end

    end

    def won?
        outcome = false
        
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                return combo

            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return combo

            else
                outcome
            end
        end

        outcome
                   
        
    end

    def full?
        result = false
        @board.each do |pos|
            if pos == " "
                result = false
                break
            else
                result = true 
            end
        end
        result
    end

    def draw?
        if full? && !won? 
            true
        elsif won?
            false
        else
            false
        end
    end

    def over?
        if draw? || won?
            true
        else
            false
        end
    end


    def winner
        if won?
             if current_player == "X"
                "O"
             else
                "X"
             end

        else
            nil
        end

    end

    def play
        while !over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end







end
