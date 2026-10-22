// All my variables:
int difficulty = 0;
Boolean insideTitle = true;
int correctAnswers = 0;
int startTime = 0;
int score = 0;
char randomLetters;
String difficultyChoice;
String message = "";
boolean gameOver = false;
int finalTime = 0;

void setup() {
  size(600, 450);
  textAlign(CENTER, CENTER);
}

void draw() {
  if (insideTitle) {
    background(0);
    textSize(30);
    fill(255);
    text("Typing Challenge. Choose a difficulty.", 300, 65);
    
    //Easy button
    fill(114, 240, 37);
    rect(75, 160, 130, 65);
    
    // Medium button
    fill(236, 255, 11);
    rect(235, 160, 130, 65);
    
    // Hard button
    fill(255, 26, 8);
    rect(395, 160, 130, 65);

    fill(40);
    textSize(20);
    text("Easy", 140, 192);
    text("Medium", 300, 192);
    text("Hard", 460, 192);
    
  } else {
    if (difficulty == 1) {
      background(114, 240, 37);
      
    } else if (difficulty == 2) {
      background(236, 255, 11);
      
    } else {
      background(255, 26, 8);
    }

    fill(0);
    textSize(28);
    text(difficultyChoice + " level", 300, 100);

    textSize(60);
    text(randomLetters, 300, 190);

    textSize(22);
    text(message, 300, 260);

    text("Score: " + correctAnswers, 300, 320);

    int seconds;

    if (gameOver) {
      seconds = finalTime;
    } else {
      seconds = (millis() - startTime) / 1000;
    }

    text("Time: " + seconds + " seconds", 300, 365);
  }
}



void mousePressed() {
  if (insideTitle) {
    if (mouseX >= 75 && mouseX <= 205 && mouseY >= 160 && mouseY <= 225) {
      difficulty = 1;
      difficultyChoice = "Easy";
      randomLetters = (char) random('a', 'i' + 1);
      
    } else if (mouseX >= 235 && mouseX <= 365 && mouseY >= 160 && mouseY <= 225) {
      difficulty = 2;
      difficultyChoice = "Medium";
      randomLetters = (char) random('j', 'q' + 1);
      
    } else if (mouseX >= 395 && mouseX <= 525 && mouseY >= 160 && mouseY <= 225) {
      difficulty = 3;
      difficultyChoice = "Hard";
      randomLetters = (char) random('r', 'z' + 1);
      
    } else {
      return;
    }

    correctAnswers = 0;
    startTime = millis();
    message = "";
    insideTitle = false;
    gameOver = false;
    finalTime = 0;
  }
}


void keyPressed() {
  if (!insideTitle && !gameOver) {
    if (Character.toLowerCase(key) == randomLetters) {
      message = "You are correct!";
      correctAnswers++;

      if (difficulty == 1) {
        randomLetters = (char) random('a', 'i' + 1);
        
      } else if (difficulty == 2) {
        randomLetters = (char) random('j', 'q' + 1);
        
      } else {
        randomLetters = (char) random('r', 'z' + 1);
      }
    } else {
      message = "Game over! You lost!";
      finalTime = (millis() - startTime) / 1000;
      gameOver = true;
    }
  }
}
