/*
Processing Assignment 6 - Simple Game
Purpose: Create a Simple Game in processing, no fancy graphics, just a simple game
Start Date: October 27th, 2022

I will be creating a simple tic tac toe game
*/


// pick a random first player
String[] randFirst = {"x", "o"};
String firstPlayer = randFirst[(int)random(0, 2)];
String currentPlayer = firstPlayer;

// set default winner value
String winner = "none";

// define WIDTH and HEIGHT variables
int WIDTH = 500;
int HEIGHT = 500;

// define wins
int xWins = 0;
int oWins = 0;
int ties = 0;

// array's to store the board
int[] row1 = {0, 0, 0};
int[] row2 = {0, 0, 0};
int[] row3 = {0, 0, 0};

// boolean values to check if rows are blank
boolean rowOneBlank = true;
boolean rowTwoBlank = true;
boolean rowThreeBlank = true;
boolean columnOneBlank = true;
boolean columnTwoBlank = true;
boolean columnThreeBlank = true;
boolean diagonalOneBlank = true;
boolean diagonalTwoBlank = true;
boolean start = true;

// boolean value to check if someone has won (set as true to start (due to start screen))
boolean win = true;

// Setup function
void setup() {
    // create the board & window
    size(500, 500);
    startScreen();
}

// Draw function
void draw() {
}

// function to draw the board
void drawBoard() {
    // set the background color to white
    background(255);
    // set stroke properties
    stroke(0);
    strokeWeight(5);
    // draw the board
    line(0, HEIGHT/3, WIDTH, HEIGHT/3);
    line(0, 2*HEIGHT/3, WIDTH, 2*HEIGHT/3);
    line(WIDTH/3, 0, WIDTH/3, HEIGHT);
    line(2*WIDTH/3, 0, 2*WIDTH/3, HEIGHT);
}

// mouse pressed function (will run when the mouse is pressed)
void mousePressed() {
    // check if anyone has won
    if(!win) {
        // get the x and y position of the mouse
        int x = mouseX;
        int y = mouseY;
        // check what position the mouse is in to place the x or o
        int xIndex = x/(WIDTH/3);
        int yIndex = y/(HEIGHT/3);
        println(xIndex, yIndex);
        int xCoord = xIndex*(WIDTH/3) + WIDTH/6;
        int yCoord = yIndex*(HEIGHT/3) + HEIGHT/6;
        if (currentPlayer == "x") {
                // if the yIndex is 0, then the row is row1
                if (yIndex == 0) {
                    // check if the box is already filled
                    if (row1[xIndex] == 0) {
                        row1[xIndex] = 1;
                        if (rowOneBlank) {
                        rowOneBlank = false;
                        }
                        // draw the x on the board
                        line(xCoord - 50, yCoord - 50, xCoord + 50, yCoord + 50);
                        line(xCoord - 50, yCoord + 50, xCoord + 50, yCoord - 50);
                        // log row1, row2, and row3 arrays to the console
                        logRows();
                        // check what rows are filled
                        checkBlanks();
                        // check if someone has won
                        checkWin();
                        // change the current player
                        switchPlayer();
                    }
                // If the yIndex is 1, then row is row2
                } else if (yIndex == 1) {
                    // check if the box is already filled
                    if (row2[xIndex] == 0) {
                        row2[xIndex] = 1;
                        if (rowTwoBlank) {
                        rowTwoBlank = false;
                        }
                        // draw the x on the board
                        line(xCoord - 50, yCoord - 50, xCoord + 50, yCoord + 50);
                        line(xCoord - 50, yCoord + 50, xCoord + 50, yCoord - 50);
                        // log row1, row2, and row3 arrays to the console
                        logRows();
                        // check what rows are filled
                        checkBlanks();
                        // check if someone has won
                        checkWin();
                        // change the current player
                        switchPlayer();
                    }
                // if the yIndex is 2, then row is row3
                } else {
                    // check if the box is already filled
                    if (row3[xIndex] == 0) {
                        row3[xIndex] = 1;
                        if (rowThreeBlank) {
                        rowThreeBlank = false;
                        }
                        // draw the x on the board
                        line(xCoord - 50, yCoord - 50, xCoord + 50, yCoord + 50);
                        line(xCoord - 50, yCoord + 50, xCoord + 50, yCoord - 50);
                        // log row1, row2, and row3 arrays to the console
                        logRows();
                        // check what rows are filled
                        checkBlanks();
                        // check if someone has won
                        checkWin();
                        // change the current player
                        switchPlayer();
                    }
                }
        // if it's o's turn
        } else {
            // if the yIndex is 0, then the row is row1
            if (yIndex == 0) {
                // check if the box is already filled
                if (row1[xIndex] == 0) {
                    row1[xIndex] = 2;
                    if (rowOneBlank) {
                        rowOneBlank = false;
                    }
                    // draw the o on the board
                    ellipse(xCoord, yCoord, 100, 100);
                    // log row1, row2, and row3 arrays to the console
                    logRows();
                    // check what rows are filled
                    checkBlanks();
                    // check if someone has won
                    checkWin();
                    // change the current player
                    switchPlayer();
                }
            // If the yIndex is 1, then row is row2
            } else if (yIndex == 1) {
                if (row2[xIndex] == 0) {
                    row2[xIndex] = 2;
                    if (rowTwoBlank) {
                        rowTwoBlank = false;
                    }
                    // draw the o on the board
                    ellipse(xCoord, yCoord, 100, 100);
                    // log row1, row2, and row3 arrays to the console
                    logRows();
                    // check what rows are filled
                    checkBlanks();
                    // check if someone has won
                    checkWin();
                    // change the current player
                    switchPlayer();
                }
            // if the yIndex is 2, then row is row3
            } else {
                if (row3[xIndex] == 0) {
                    row3[xIndex] = 2;
                    if (rowThreeBlank) {
                        rowThreeBlank = false;
                    }
                    // draw the o on the board
                    ellipse(xCoord, yCoord, 100, 100);
                    // log row1, row2, and row3 arrays to the console
                    logRows();
                    // check what rows are filled
                    checkBlanks();
                    // check if someone has won
                    checkWin();
                    // change the current player
                    switchPlayer();
                }
            }
        }
    }
    // if someone has won
    else {
        // check if someone clicks the restart button
        if (mouseX > WIDTH/2 - 100 && mouseX < WIDTH/2 + 100 && mouseY > HEIGHT/2 + 50 && mouseY < HEIGHT/2 + 100) {
            // start screen
            if (start) {
                win = false;
                drawBoard();
            }
            // play again screen
            else {
                resetGame();
            }

        }
    }
}

// switch player function
void switchPlayer() {
    if (currentPlayer == "x") {
        currentPlayer = "o";
    } else {
        currentPlayer = "x";
    }
}

// check what rows are filled
void checkBlanks() {
    // check if row1 is filled
    if (row1[0] != 0 && row1[1] != 0 && row1[2] != 0) {
        rowOneBlank = false;
    }
    // check if row2 is filled
    if (row2[0] != 0 && row2[1] != 0 && row2[2] != 0) {
        rowTwoBlank = false;
    }
    // check if row3 is filled
    if (row3[0] != 0 && row3[1] != 0 && row3[2] != 0) {
        rowThreeBlank = false;
    }
    // check if col1 is filled
    if (row1[0] != 0 && row2[0] != 0 && row3[0] != 0) {
        columnOneBlank = false;
    }
    // check if col2 is filled
    if (row1[1] != 0 && row2[1] != 0 && row3[1] != 0) {
        columnTwoBlank = false;
    }
    // check if col3 is filled
    if (row1[2] != 0 && row2[2] != 0 && row3[2] != 0) {
        columnThreeBlank = false;
    }
    // check if diag1 is filled
    if (row1[0] != 0 && row2[1] != 0 && row3[2] != 0) {
        diagonalOneBlank = false;
    }
    // check if diag2 is filled
    if (row1[2] != 0 && row2[1] != 0 && row3[0] != 0) {
        diagonalTwoBlank = false;
    }
}

// log row1, row2, and row3 arrays to the console
void logRows(){
    println("row1: " + row1[0] + " " + row1[1] + " " + row1[2]);
    println("row2: " + row2[0] + " " + row2[1] + " " + row2[2]);
    println("row3: " + row3[0] + " " + row3[1] + " " + row3[2]);
}

// check if someone has won
void checkWin() {
    // check if row1 is filled by 1 player
    if (!rowOneBlank && row1[0] == row1[1] && row1[1] == row1[2]) {
        println("row 1 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if row2 is filled by 1 player
    else if (!rowTwoBlank && row2[0] == row2[1] && row2[1] == row2[2]) {
        println("row 2 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if row3 is filled by 1 player
    else if (!rowThreeBlank && row3[0] == row3[1] && row3[1] == row3[2]) {
        println("row 3 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if col1 is filled by 1 player
    else if (!columnOneBlank && row1[0] == row2[0] && row2[0] == row3[0]) {
        println("column 1 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if col2 is filled by 1 player
    else if (!columnTwoBlank && row1[1] == row2[1] && row2[1] == row3[1]) {
        println("column 2 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if col3 is filled by 1 player
    else if (!columnThreeBlank && row1[2] == row2[2] && row2[2] == row3[2]) {
        println("column 3 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if diag1 is filled by 1 player
    else if (!diagonalOneBlank && row1[0] == row2[1] && row2[1] == row3[2]) {
        println("diagonal 1 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if diag2 is filled by 1 player
    else if (!diagonalTwoBlank && row1[2] == row2[1] && row2[1] == row3[0]) {
        println("diagonal 2 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    // check if the board is full
    else if (!rowOneBlank && !rowTwoBlank && !rowThreeBlank && !columnOneBlank && !columnTwoBlank && !columnThreeBlank && !diagonalOneBlank && !diagonalTwoBlank) {
        println("tie");
        currentPlayer = "tie";
        win = true;
    }
    // if someone has won
    if (win) {
        // set the winner
        winner = currentPlayer;
        // add 1 to the winner's score
        wins();
        // display the winner
        winScreen();
    }
}

void wins() {
    // if x wins, add 1 to x's score
    if (winner == "x") {
        xWins++;
    }
    // if o wins, add 1 to o's score
    else if (winner == "o") {
        oWins++;
    }
    // if there is a tie, add 1 to ties
    else {
        ties++;
    }
}

void winScreen() {
    // set background color to white
    background(255);
    // set text color to black
    fill(0);
    // set text size to 50
    textSize(50);
    // display the winner (or tie)
    textAlign(CENTER);
    if (winner == "tie") {
        text("Tie!", WIDTH/2, HEIGHT/2 - 100);
    } else {
        text(winner + " wins!", WIDTH/2, HEIGHT/2 - 100);
    }
    // display play again button
    fill(0, 0, 0);
    rect(WIDTH/2 - 100, HEIGHT/2 + 50, 200, 50);
    fill(255);
    textSize(30);
    text("Play Again", WIDTH/2, HEIGHT/2 + 85);
    // display score at bottom of screen
    fill(0);
    textSize(20);
    text("X wins: " + xWins + " O wins: " + oWins + " Ties: " + ties, WIDTH/2, HEIGHT - 20);
    fill(255);
}

void resetGame() {
    // reset the board
    for (int i = 0; i < 3; i++) {
        row1[i] = 0;
        row2[i] = 0;
        row3[i] = 0;
    }
    // reset all the booleans
    rowOneBlank = true;
    rowTwoBlank = true;
    rowThreeBlank = true;
    columnOneBlank = true;
    columnTwoBlank = true;
    columnThreeBlank = true;
    diagonalOneBlank = true;
    diagonalTwoBlank = true;
    win = false;
    // reset the winner
    winner = "";
    // log the board to the console
    println("game reset");
    // draw the board
    drawBoard();
}

// draw the start screen
void startScreen() {
    // set background color to white
    background(255);
    // set text color to black
    fill(0);
    // set text size to 50
    textSize(30);
    // display the welcome message
    textAlign(CENTER);
    text("Welcome to Tic-Tac-Toe!", WIDTH/2, HEIGHT/2 - 100);
    // display start button
    rect(WIDTH/2 - 100, HEIGHT/2 + 50, 200, 50);
    fill(255);
    textSize(30);
    text("Start", WIDTH/2, HEIGHT/2 + 85);
    // display description at bottom of screen
    fill(0);
    textSize(20);
    text("This is a two player version of the popular tic-tac-toe game.", WIDTH/2, HEIGHT - 20);
    fill(255);
    start = false;
}