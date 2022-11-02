/*
Processing Assignment 6 - Simple Game
Purpose: Create a Simple Game in processing, no fancy graphics, just a simple game
Start Date: November 1st, 2022

I will be creating a simple tic tac toe game
*/

String currentPlayer = "x"; // x is the first player
String winner = "none"; // no winner yet

int WIDTH = 500;
int HEIGHT = 500;

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

boolean win = false;

void setup() {
    size(500, 500);
    drawBoard();
}

void draw() {
}

void drawBoard() {
    background(255);
    stroke(0);
    strokeWeight(5);
    line(0, HEIGHT/3, WIDTH, HEIGHT/3);
    line(0, 2*HEIGHT/3, WIDTH, 2*HEIGHT/3);
    line(WIDTH/3, 0, WIDTH/3, HEIGHT);
    line(2*WIDTH/3, 0, 2*WIDTH/3, HEIGHT);
}

void mousePressed() {
    if(!win) {
        int x = mouseX;
        int y = mouseY;
        int xIndex = x/(WIDTH/3);
        int yIndex = y/(HEIGHT/3);
        int xCoord = xIndex*(WIDTH/3) + WIDTH/6;
        int yCoord = yIndex*(HEIGHT/3) + HEIGHT/6;
        if (currentPlayer == "x") {
                if (yIndex == 0) {
                    if (row1[xIndex] == 0) {
                        row1[xIndex] = 1;
                        if (rowOneBlank) {
                        rowOneBlank = false;
                        }
                        line(xCoord - 50, yCoord - 50, xCoord + 50, yCoord + 50);
                        line(xCoord - 50, yCoord + 50, xCoord + 50, yCoord - 50);
                        logRows();
                        checkBlanks();
                        checkWin();
                        switchPlayer();
                    }
                } else if (yIndex == 1) {
                    if (row2[xIndex] == 0) {
                        row2[xIndex] = 1;
                        if (rowTwoBlank) {
                        rowTwoBlank = false;
                        }
                        line(xCoord - 50, yCoord - 50, xCoord + 50, yCoord + 50);
                        line(xCoord - 50, yCoord + 50, xCoord + 50, yCoord - 50);
                        logRows();
                        checkBlanks();
                        checkWin();
                        switchPlayer();
                    }
                } else {
                    if (row3[xIndex] == 0) {
                        row3[xIndex] = 1;
                        if (rowThreeBlank) {
                        rowThreeBlank = false;
                        }
                        line(xCoord - 50, yCoord - 50, xCoord + 50, yCoord + 50);
                        line(xCoord - 50, yCoord + 50, xCoord + 50, yCoord - 50);
                        logRows();
                        checkBlanks();
                        checkWin();
                        switchPlayer();
                    }
                }
        } else {
            if (yIndex == 0) {
                if (row1[xIndex] == 0) {
                    row1[xIndex] = 2;
                    if (rowOneBlank) {
                        rowOneBlank = false;
                    }
                    ellipse(xCoord, yCoord, 100, 100);
                    logRows();
                    checkBlanks();
                    checkWin();
                    switchPlayer();
                }
            } else if (yIndex == 1) {
                if (row2[xIndex] == 0) {
                    row2[xIndex] = 2;
                    if (rowTwoBlank) {
                        rowTwoBlank = false;
                    }
                    ellipse(xCoord, yCoord, 100, 100);
                    logRows();
                    checkBlanks();
                    checkWin();
                    switchPlayer();
                }
            } else {
                if (row3[xIndex] == 0) {
                    row3[xIndex] = 2;
                    if (rowThreeBlank) {
                        rowThreeBlank = false;
                    }
                    ellipse(xCoord, yCoord, 100, 100);
                    logRows();
                    checkBlanks();
                    checkWin();
                    switchPlayer();
                }
            }
        }
    }
    else {
        // width/2 - 100, height/2 + 50, 200, 50
        if (mouseX > WIDTH/2 - 100 && mouseX < WIDTH/2 + 100 && mouseY > HEIGHT/2 + 50 && mouseY < HEIGHT/2 + 100) {
            resetGame();
        }
    }
}

void switchPlayer() {
    if (currentPlayer == "x") {
        currentPlayer = "o";
    } else {
        currentPlayer = "x";
    }
}

void checkBlanks() {
    if (row1[0] != 0 && row1[1] != 0 && row1[2] != 0) {
        rowOneBlank = false;
    }
    if (row2[0] != 0 && row2[1] != 0 && row2[2] != 0) {
        rowTwoBlank = false;
    }
    if (row3[0] != 0 && row3[1] != 0 && row3[2] != 0) {
        rowThreeBlank = false;
    }
    if (row1[0] != 0 && row2[0] != 0 && row3[0] != 0) {
        columnOneBlank = false;
    }
    if (row1[1] != 0 && row2[1] != 0 && row3[1] != 0) {
        columnTwoBlank = false;
    }
    if (row1[2] != 0 && row2[2] != 0 && row3[2] != 0) {
        columnThreeBlank = false;
    }
    if (row1[0] != 0 && row2[1] != 0 && row3[2] != 0) {
        diagonalOneBlank = false;
    }
    if (row1[2] != 0 && row2[1] != 0 && row3[0] != 0) {
        diagonalTwoBlank = false;
    }
}

void logRows(){
    println("row1: " + row1[0] + " " + row1[1] + " " + row1[2]);
    println("row2: " + row2[0] + " " + row2[1] + " " + row2[2]);
    println("row3: " + row3[0] + " " + row3[1] + " " + row3[2]);
}

void checkWin() {
    if (!rowOneBlank && row1[0] == row1[1] && row1[1] == row1[2]) {
        println("row 1 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!rowTwoBlank && row2[0] == row2[1] && row2[1] == row2[2]) {
        println("row 2 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!rowThreeBlank && row3[0] == row3[1] && row3[1] == row3[2]) {
        println("row 3 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!columnOneBlank && row1[0] == row2[0] && row2[0] == row3[0]) {
        println("column 1 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!columnTwoBlank && row1[1] == row2[1] && row2[1] == row3[1]) {
        println("column 2 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!columnThreeBlank && row1[2] == row2[2] && row2[2] == row3[2]) {
        println("column 3 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!diagonalOneBlank && row1[0] == row2[1] && row2[1] == row3[2]) {
        println("diagonal 1 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!diagonalTwoBlank && row1[2] == row2[1] && row2[1] == row3[0]) {
        println("diagonal 2 win");
        println(currentPlayer + " wins!");
        win = true;
    }
    else if (!rowOneBlank && !rowTwoBlank && !rowThreeBlank && !columnOneBlank && !columnTwoBlank && !columnThreeBlank && !diagonalOneBlank && !diagonalTwoBlank) {
        println("tie");
        currentPlayer = "tie";
        win = true;
    }
    if (win) {
        winner = currentPlayer;
        wins();
        dispWin();
    }
}

void wins() {
    if (winner == "x") {
        xWins++;
    } else if (winner == "o") {
        oWins++;
    } else {
        ties++;
    }
}

void winScreen() {
    background(255);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    if (winner == "tie") {
        text("Tie!", WIDTH/2, HEIGHT/2 - 100);
    } else {
        text(winner + " wins!", WIDTH/2, HEIGHT/2 - 100);
    }
    // display play again button
    fill(0, 0, 0);
    rect(width/2 - 100, height/2 + 50, 200, 50);
    fill(255);
    textSize(30);
    text("Play Again", width/2, height/2 + 85);
    // display score at bottom
    fill(0);
    textSize(20);
    text("X wins: " + xWins + " O wins: " + oWins + " Ties: " + ties, width/2, height - 20);
    fill(255);
}

void dispWin() {
    if (winner == "x") {
        winScreen();
    } else if (winner == "o") {
        winScreen();
    } else {
        winScreen();
    }
}

void resetGame() {
    for (int i = 0; i < 3; i++) {
        row1[i] = 0;
        row2[i] = 0;
        row3[i] = 0;
    }
    rowOneBlank = true;
    rowTwoBlank = true;
    rowThreeBlank = true;
    columnOneBlank = true;
    columnTwoBlank = true;
    columnThreeBlank = true;
    diagonalOneBlank = true;
    diagonalTwoBlank = true;
    win = false;
    winner = "";
    println("game reset");
    drawBoard();
}