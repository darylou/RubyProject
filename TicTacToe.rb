# Daryl Ou -- Tic Tac Toe Game

def boardSetup() # Makes a new game
    board = [[Array.new(3) { Array.new(3)}]]
    board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    return board
end

def nextMove(currMove, board) # Insert player's move either X or O
    isValid = false
    while !isValid
        puts "PLAYER: " + currMove
        puts "What row: "
        row = gets
        row = row.to_i
        row -= 1
        puts "What column:"
        column = gets
        column = column.to_i
        column -= 1
        
        if (board[row][column] == " ")
            board[row][column] = currMove
            isValid = true;
            puts ""
        else
            puts "INVALID POSITION"
            puts ""
        end
    end
    return board
end

def checkWinCondition(currPlayer, board) # Checks the board for a winning streak
    isDone = false
    if (board[0][0] == currPlayer) && (board[1][0] == board[0][0]) && (board[2][0] == board[0][0]) # Checks left vert
        isDone = true
    elsif (board[0][0] == currPlayer) && (board[0][1] == board[0][0]) && (board[0][2] == board[0][0]) # Checks top horiz
        isDone = true;
    elsif (board[1][1] == currPlayer) && (board[0][0] == board[1][1]) && (board[2][2] == board[1][1]) # Checks top left diag
        isDone = true;
    elsif (board[1][1] == currPlayer) && (board[0][2] == board[1][1]) && (board[2][0] == board[1][1]) # Checks top right diag
        isDone = true;
    elsif (board[1][1] == currPlayer) && (board[1][0] == board[1][1]) && (board[1][2] == board[1][1]) # Checks middle horiz
        isDone = true;
    elsif (board[1][1] == currPlayer) && (board[0][1] == board[1][1]) && (board[2][1] == board[1][1]) # Checks middle vert
        isDone = true;
    elsif (board[2][2] == currPlayer) && (board[2][0] == board[2][2]) && (board[2][1] == board[2][2]) # CHecks bottom horiz
        isDone = true;
    elsif (board[2][2] == currPlayer) && (board[0][2] == board[2][2]) && (board[1][2] == board[2][2]) # CHecks bottom horiz
        isDone = true;
    end
    if isDone
        puts currPlayer + " IS THE WINNER"
    else
        isDone = true;
        for i in 0..2 do
            for j in 0..2 do
                if board[i][j] == " "
                    isDone = false
                    break
                end
            end
        end
        if isDone
            puts "STALEMATE"
        end
    end
    return isDone
end

def printBoard(board) # Prints the board
    puts ""
    for i in 0..2 do
        for j in 0..2 do
            if j < 2
                print " " + board[i][j].to_s + " |"
            else
                print " " + board[i][j]
            end
        end
        puts ""
        if i < 2
            puts "--- --- ---"
        end
    end
    puts ""
end

board = boardSetup()
currPlayer = "O"
loop do # Game
    printBoard(board)
    nextMove(currPlayer, board)
    
    if checkWinCondition(currPlayer, board)
        break
    else
        if currPlayer == "O"
            currPlayer = "X"
        else
            currPlayer = "O"
        end
    end
end