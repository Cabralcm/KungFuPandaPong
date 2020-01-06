/*
TO DO:

Power Ups
-- Random position within your area every 1 minute

-- Ball Speed on other person's side (+10 seconds)
-- Reverse Other Player (+10 seconds)
-- Invincible (10 seconds)
-- Make yourself faster (+9)
-- Make yourself bigger
-- Make enemy smaller
*/

int rectXposition = 50;
int rectYposition = 100;

int secondRectXposition = 520;
int secondRectYposition = 100;

int rectWidth = 100;
int rectHeight = 100;

int speed = 5;
int playerspeed = 7;
int directionX = 1;
int directionY = 1;

PImage myImage;
PImage field;
PImage player1;
PImage player2; 

int circleWidth = 100;
int circleHeight = 100;
int circleXposition = 150;
int circleYposition = 100;

static int gameover = 5;

boolean leftRectUP, leftRectDOWN, leftRectRIGHT, leftRectLEFT = false;
boolean rightRectUP, rightRectDOWN, rightRectRIGHT, rightRectLEFT = false;

static boolean pause = false;
static int pauseSpeed = 0;

static int pauseXdirection = 0;
static int pauseYdirection = 0;

int playerscore1 = 0;
int playerscore2 = 0;

// Title
int x_Title = 170;
int y_Title = 40;
int width_Title = 250;
int height_Title = 50;

//Start Button
int x_startButton = 240;
int y_startButton = 280;
int width_startButton = 150;
int height_startButton = 50;

//Player 1 Options
int x_player1Button = 240;
int y_player1Button = 100;
int width_player1Button = 150;
int height_player1Button = 50;

// Player 1 Increase Button
int x_player1Increase = 400;
int y_player1Increase = 100;
int width_player1Increase = 50;
int height_player1Increase = 50;

// Player 1 Decrease Button
int x_player1Decrease = 180;
int y_player1Decrease = 100;
int width_player1Decrease = 50;
int height_player1Decrease = 50;

//Player 2 Options
int x_player2Button = 240;
int y_player2Button = 160;
int width_player2Button = 150;
int height_player2Button = 50;

// Player 2 Increase Button
int x_player2Increase = 400;
int y_player2Increase = 160;
int width_player2Increase = 50;
int height_player2Increase = 50;

// Player 2 Decrease Button
int x_player2Decrease = 180;
int y_player2Decrease = 160;
int width_player2Decrease = 50;
int height_player2Decrease = 50;

//Game Score
int x_gamescore = 240;
int y_gamescore = 220;
int width_gamescore = 150;
int height_gamescore = 50;

//Increase Game Score
int x_Incgamescore = 400;
int y_Incgamescore = 220;
int width_Incgamescore = 50;
int height_Incgamescore = 50;

//Decrease Game Score
int x_Decgamescore = 180;
int y_Decgamescore = 220;
int width_Decgamescore = 50;
int height_Decgamescore = 50;

// Main Menu Button
int x_MainMenu = 240;
int y_MainMenu = 180;
int width_MainMenu = 150; 
int height_MainMenu = 50;

//Restart Game Button
int x_RestartGame = 240;
int y_RestartGame = 240;
int width_RestartGame = 150;
int height_RestartGame = 50;

// Resume Game Button
int x_ResumeGame = 240;
int y_ResumeGame = 120;
int width_ResumeGame = 150; 
int height_ResumeGame = 50;

// Round the edges of the Buttons
int buttonRadius = 7;

//Start Menu Flags
boolean overStartButtonFlag = false;
boolean overIncreaseP1Flag = false;
boolean overDecreaseP1Flag = false;
boolean overIncreaseP2Flag = false;
boolean overDecreaseP2Flag = false;
boolean overIncreaseScoreFlag = false;
boolean overDecreaseScoreFlag = false;

//Game Over and Pause Menu Flags 
boolean overMainMenuFlag = false;
boolean overRestartButtonFlag = false;
boolean overResumeGameFlag = false;

//Dictates the states of the program
// If 0, Start Menu
// If 1, Start/Restart Game
// If 2, Resume Game
// If 3, Pause Menu
// If 4, Game Over Menu 
int ProgramState = 0; 

String[] player1Array;
String[] player2Array;
String[] player1NameArray;
String[] player2NameArray;
int player1Option = 0;
int player2Option = 0;

int[] speedArray;
String[] speedNameArray;
int speedOption = 3;

int winner = 0;

public void settings(){
  size(640,480);
}

void setup(){
  myImage = loadImage("ball.png");
  field = loadImage("field1.png");
  player1Array = new String[] {"player1_100_L.png", "player2_100_L.png", "player3_100_L.png", "player4_100_L.png", "player5_100_L.png"};
  player2Array = new String[] {"player2_100_R.png", "player3_100_R.png", "player4_100_R.png", "player5_100_R.png", "player1_100_R.png"};
  
  player1NameArray = new String[] {"Po", "Tigeress", "Crane", "Viper", "Shifu"};
  player2NameArray = new String[] {"Tigeress", "Crane", "Viper", "Shifu", "Po"};
  
  speedArray = new int[] {3,4,5,6,7};
  speedNameArray= new String[] {"Very Easy", "Easy", "Normal", "Harder", "Hardest"};
    
  player1 = loadImage("player1_100_L.png");
  player2 = loadImage("player2_100_R.png");
  
  ProgramState = 0;
  
  //Maximum Point
  gameover = 5;
}

void draw(){
  //background(5);
  image(field,0,0,width,height);
  background(field);
  
  if(ProgramState == 0){ // If 0, Start Menu
    StartMenuState();
   }
  if(ProgramState == 1){ // If 1, Start/Restart Game
    StartGameState();
    ProgramState = 2;
   }
   else if(ProgramState == 2){ // If 2, Resume Game
    PlayGameState();
    //return;
   }
   else if(ProgramState == 3){ // If 3, Pause Menu
    System.out.println("HERE!");
    PauseMenu();
    //return;
   }
   else if(ProgramState == 4){ // If 4, Game Over Menu 
    GameOver();
    //return;
   }
}


void mousePressed(){
  updateMouse(mouseX, mouseY);
  if(overStartButtonFlag && ProgramState == 0){
    ProgramState = 1;
  }
  if(overRestartButtonFlag && ProgramState == 4){
    ProgramState = 1;
  }
  //if(over
  if(overIncreaseP1Flag && ProgramState == 0){
    if((player1Option + 1) > 4){
      player1Option = 0;
    }
    else{
      player1Option += 1;
    }
  }
  if(overDecreaseP1Flag && ProgramState == 0){
    if((player1Option - 1) < 0){
      player1Option = 4;
    }
    else{
      player1Option -= 1;
    }
  }
  if(overIncreaseP2Flag && ProgramState == 0){
    if((player2Option + 1) > 4){
      player2Option = 0;
    }
    else{
      player2Option += 1;
    }
  }
   if(overDecreaseP2Flag && ProgramState == 0){
    if((player2Option - 1) < 0){
      player2Option = 4;
    }
    else{
      player2Option -= 1;
    }
  }
  if(overIncreaseScoreFlag && ProgramState == 0){
    gameover += 1;
  }
  if(overDecreaseScoreFlag && ProgramState == 0){
    if(gameover == 1){
    }
    else{
      gameover -= 1;
    }
  }
  if(overMainMenuFlag){
    ProgramState = 0;
  }
  if(overRestartButtonFlag){
    ProgramState = 1;
  }
  if(overResumeGameFlag){
    ResumeGame();
    pause = false;
    ProgramState = 2;
  }
}
//////////////////////////////////////

void updateMouse(int x, int y){
  if(overStartButton(x, y, x_startButton, y_startButton, width_startButton, height_startButton)){
    overStartButtonFlag = true;
  }
  else{
    overStartButtonFlag = false;
  }
  if (overP1Increase(x, y, x_player1Increase, y_player1Increase, width_player1Increase, height_player1Increase)){
    overIncreaseP1Flag = true;
  }
  else{
    overIncreaseP1Flag = false;
  }
  if(overP1Decrease(x, y, x_player1Decrease, y_player1Decrease, width_player1Decrease, height_player1Decrease)){
    overDecreaseP1Flag = true;
  }
  else{
    overDecreaseP1Flag = false;
  }
  if(overP2Increase(x, y, x_player2Increase, y_player2Increase, width_player2Increase, height_player2Increase)){
    overIncreaseP2Flag = true;
  }
  else{
    overIncreaseP2Flag = false;
  }
  if(overP2Decrease(x, y, x_player2Decrease, y_player2Decrease, width_player2Decrease, height_player2Decrease)){
    overDecreaseP2Flag = true;
  }
  else{
    overDecreaseP2Flag = false;
  }
  if(overIncGameScore(x, y, x_Incgamescore, y_Incgamescore, width_Incgamescore, height_Incgamescore)){
    overIncreaseScoreFlag = true;
  }
  else{
    overIncreaseScoreFlag  = false;
  }
  if(overDecGameScore(x,y, x_Decgamescore, y_Decgamescore, width_Decgamescore, height_Decgamescore)){
    overDecreaseScoreFlag = true;
  }
  else{
    overDecreaseScoreFlag = false;
  }
  if(overRestartGame(x,y, x_RestartGame, y_RestartGame, width_RestartGame, height_RestartGame)){
    overRestartButtonFlag = true;
  }
  else{
    overRestartButtonFlag = false;
  }
  if(overMainMenu(x,y, x_MainMenu, y_MainMenu, width_MainMenu, height_MainMenu )){
    overMainMenuFlag = true;
  }
  else{
    overMainMenuFlag = false;
  }
  if(overResumeGame(x,y, x_ResumeGame, y_ResumeGame, width_ResumeGame, height_ResumeGame)){
    overResumeGameFlag = true;
  }
  else{
    overResumeGameFlag = false;
  }
}
/////////////////////////////////////////////
/// OVER BUTTON FUNCTIONS
/////////////////////////////////////////////

boolean overRestartGame(int x, int y, int x_RestartGame, int y_RestartGame, int width_RestartGame, int height_RestartGame){
if(x >= x_RestartGame && 
  (x <= x_RestartGame + width_RestartGame) && 
  y >= y_RestartGame &&
  (y <= y_RestartGame + height_RestartGame)){
    return true;
  }
  else{
    return false;
  }
}

boolean overMainMenu(int x,int y, int x_MainMenu, int y_MainMenu, int width_MainMenu, int height_MainMenu){
if(x >= x_MainMenu && 
  (x <= x_MainMenu + width_MainMenu) && 
  y >= y_MainMenu &&
  (y <= y_MainMenu + height_MainMenu)){
    return true;
  }
  else{
    return false;
  }
}

boolean overResumeGame(int x, int y, int x_ResumeGame, int y_ResumeGame, int width_ResumeGame, int height_ResumeGame){
if(x >= x_ResumeGame && 
  (x <= x_ResumeGame + width_ResumeGame) && 
  y >= y_ResumeGame &&
  (y <= y_ResumeGame + height_ResumeGame)){
    return true;
  }
  else{
    return false;
  }
}

boolean overStartButton (int x, int y, int x_startButton, int y_startButton, int width_startButton, int height_startButton){
  if(x >= x_startButton && 
  (x <= x_startButton + width_startButton) && 
  y >= y_startButton &&
  (y <= y_startButton + height_startButton)){
    return true;
  }
  else{
    return false;
  }
}
 
boolean overP1Increase (int x, int y, int x_player1Increase, int y_player1Increase, int width_player1Increase, int height_player1Increase){
  if(x >= x_player1Increase && 
  (x <= x_player1Increase + width_player1Increase) && 
  y >= y_player1Increase &&
  (y <= y_player1Increase + height_player1Increase)){
    return true;
  }
  else{
    return false;
  }
}

boolean overP1Decrease(int x, int y, int x_player1Decrease, int y_player1Decrease, int width_player1Decrease, int height_player1Decrease){
  if(x >= x_player1Decrease && 
  (x <= x_player1Decrease + width_player1Decrease) && 
  y >= y_player1Decrease &&
  (y <= y_player1Decrease + height_player1Decrease)){
    return true;
  }
  else{
    return false;
  }
}

boolean overP2Increase (int x, int y, int x_player2Increase, int y_player2Increase, int width_player2Increase, int height_player2Increase){
  if(x >= x_player2Increase && 
  (x <= x_player2Increase + width_player2Increase) && 
  y >= y_player2Increase &&
  (y <= y_player2Increase + height_player2Increase)){
    return true;
  }
  else{
    return false;
  }
}

boolean overP2Decrease(int x, int y, int x_player2Decrease, int y_player2Decrease, int width_player2Decrease, int height_player2Decrease){
  if(x >= x_player2Decrease && 
  (x <= x_player2Decrease + width_player2Decrease) && 
  y >= y_player2Decrease &&
  (y <= y_player2Decrease + height_player2Decrease)){
    return true;
  }
  else{
    return false;
  }
}

boolean overIncGameScore(int x, int y, int x_Incgamescore, int y_Incgamescore, int width_Incgamescore, int height_Incgamescore){
  if(x >= x_Incgamescore && 
  (x <= x_Incgamescore + width_Incgamescore) && 
  y >= y_Incgamescore &&
  (y <= y_Incgamescore + height_Incgamescore)){
    return true;
  }
  else{
    return false;
  }
}

boolean overDecGameScore(int x, int y, int x_Decgamescore, int y_Decgamescore, int width_Decgamescore, int height_Decgamescore){
  if(x >= x_Decgamescore && 
  (x <= x_Decgamescore + width_Decgamescore) && 
  y >= y_Decgamescore &&
  (y <= y_Decgamescore + height_Decgamescore)){
    return true;
  }
  else{
    return false;
  }
}
/////////////////////////////////////////////
/// END of OVER BUTTON FUNCTIONS
/////////////////////////////////////////////

/////////////////////////////////////////////
/// ProgramState = 0
/////////////////////////////////////////////
void StartMenuState(){
  // Title Text
  fill(0);
  textSize(36);
  text("Kung Fu Fighters", x_Title, y_Title + 30);
  //Player 1 - Character Selection
  fill(255);
  rect(x_player1Button, y_player1Button, width_player1Button, height_player1Button, buttonRadius);
  fill(0);
  textSize(20);
  text("P1: " + player1NameArray[player1Option], x_player1Button + 10, y_player1Button + 30);
  
  //Player 2  - Character Selection
  fill(255);
  rect(x_player2Button, y_player2Button, width_player2Button, height_player2Button, buttonRadius);
  fill(0);
  textSize(20);
  text("P2: " + player2NameArray[player2Option], x_player2Button + 10, y_player2Button + 30);
  
  //Game Score Selection
  fill(255,255,255);
  rect(x_gamescore, y_gamescore, width_gamescore, height_gamescore, buttonRadius);
  fill(0,0,0);
  textSize(20);
  text("Max Point: " + gameover, x_gamescore + 10, y_gamescore + 31);
  
  if(overStartButtonFlag){
    fill(255);
    rect(x_startButton, y_startButton, width_startButton, height_startButton, buttonRadius);
    fill(0);
    textSize(20);
    text("Start Game", x_startButton + 24, y_startButton + 32);
  }
  else{
    fill(0); //Text colour
    rect(x_startButton, y_startButton, width_startButton, height_startButton, buttonRadius);
    fill(255);//Start Button Colour
    textSize(20);
    text("Start Game", x_startButton + 24, y_startButton + 32);
  }
  if(overIncreaseP1Flag){
    fill(0,255,0);
    rect(x_player1Increase, y_player1Increase, width_player1Increase, height_player1Increase, buttonRadius);
    fill(0,0,0);
    textSize(24);
    text("+", x_player1Increase + 17, y_player1Increase + 32);
  }
  else{
    fill(0,0,0); //Text colour
    rect(x_player1Increase, y_player1Increase, width_player1Increase, height_player1Increase, buttonRadius);
    fill(255,255,255);//Start Button Colour
    textSize(24);
    text("+", x_player1Increase + 17, y_player1Increase + 32);
  }
  if(overDecreaseP1Flag){
    fill(255,0,0);
    rect(x_player1Decrease, y_player1Decrease, width_player1Decrease, height_player1Decrease, buttonRadius);
    fill(0,0,0);
    textSize(24);
    text("-", x_player1Decrease + 17, y_player1Decrease + 32);
  }
  else{
    fill(0,0,0); //Text colour
    rect(x_player1Decrease, y_player1Decrease, width_player1Decrease, height_player1Decrease, buttonRadius);
    fill(255,255,255);//Start Button Colour
    textSize(24);
    text("-", x_player1Decrease + 17, y_player1Decrease + 32);
  }
  if(overIncreaseP2Flag){
    fill(0,255,0);
    rect(x_player2Increase, y_player2Increase, width_player2Increase, height_player2Increase, buttonRadius);
    fill(0,0,0);
    textSize(24);
    text("+", x_player2Increase + 17, y_player2Increase + 32);
  }
  else{
    fill(0,0,0); //Text colour
    rect(x_player2Increase, y_player2Increase, width_player2Increase, height_player2Increase, buttonRadius);
    fill(255,255,255);//Start Button Colour
    textSize(24);
    text("+", x_player2Increase + 17, y_player2Increase + 32);
  }
  if(overDecreaseP2Flag){
    fill(255,0,0);
    rect(x_player2Decrease, y_player2Decrease, width_player2Decrease, height_player2Decrease, buttonRadius);
    fill(0,0,0);
    textSize(24);
    text("-", x_player2Decrease + 17, y_player2Decrease + 32);
  }
  else{
    fill(0,0,0); //Text colour
    rect(x_player2Decrease, y_player2Decrease, width_player2Decrease, height_player2Decrease, buttonRadius);
    fill(255,255,255);//Start Button Colour
    textSize(24);
    text("-", x_player2Decrease + 17, y_player2Decrease + 32);
  }
  if(overIncreaseScoreFlag){
    fill(0,255,0);
    rect(x_Incgamescore, y_Incgamescore, width_Incgamescore, height_Incgamescore, buttonRadius);
    fill(0,0,0);
    textSize(24);
    text("+", x_Incgamescore + 17, y_Incgamescore + 32);
  }
  else{
    fill(0,0,0); //Text colour
    rect(x_Incgamescore, y_Incgamescore, width_Incgamescore, height_Incgamescore, buttonRadius);
    fill(255,255,255);//Start Button Colour
    textSize(24);
    text("+", x_Incgamescore + 17, y_Incgamescore + 32);
  }
  if(overDecreaseScoreFlag){
    fill(255,0,0);
    rect(x_Decgamescore, y_Decgamescore, width_Decgamescore, height_Decgamescore, buttonRadius);
    fill(0,0,0);
    textSize(24);
    text("-", x_Decgamescore + 17, y_Decgamescore + 32);
  }
  else{
    fill(0,0,0); //Text colour
    rect(x_Decgamescore, y_Decgamescore, width_Decgamescore, height_Decgamescore, buttonRadius);
    fill(255,255,255);//Start Button Colour
    textSize(24);
    text("-", x_Decgamescore + 17, y_Decgamescore + 32);
  } 
  updateMouse(mouseX, mouseY);
} //END OF START MENU STATE

/////////////////////////////////////////////
/// ProgramState = 1
/////////////////////////////////////////////
void StartGameState(){
  rectXposition = 50;
  rectYposition = 100;
  secondRectXposition = 520;
  secondRectYposition = 300;
  rectWidth = 100;
  rectHeight = 100;
  speed = 5;
  playerscore1 = 0;
  playerscore2 = 0;
  directionX = 1;
  directionY = 1;
  circleXposition = 150;
  circleYposition = 100;
}

/////////////////////////////////////////////
/// ProgramState = 2
/////////////////////////////////////////////
void PlayGameState(){
  image(player1, rectXposition,rectYposition,rectWidth,rectHeight); //rectXposition and rectYposition define the UPPER LEFT CORNER
  image(player2, secondRectXposition,secondRectYposition,rectWidth,rectHeight); //rectXposition and rectYposition define the UPPER LEFT CORNER  
  image(myImage,circleXposition,circleYposition, 100,50);
  player1 = loadImage(player1Array[player1Option]);
  player2 = loadImage(player2Array[player2Option]);
  
  //Player 1 score
  textSize(28);
  text(playerscore1,50,50);
  //Player 2 score
  textSize(28);
  text(playerscore2,width-50,50);
  stroke(255);
  fill(255);

  circleXposition += (speed * directionX);
  circleYposition += (speed * directionY);
  
  if(circleXposition >= width -10 - circleWidth/2){
      directionX *= -1;
      playerscore1 += 1;
      //speedX += 1;
   }
   else if(circleXposition <= 20 - circleWidth/2){
      directionX *= -1;
      //if(invincible == false){
      playerscore2 += 1; 
      //speedX += 1;rectYposition
   } 
   if(circleYposition >= height-circleHeight/2){
      directionY *= -1;
   }
   else if(circleYposition <= 30 - circleHeight/2){
      directionY *= -1;
   }
   if((circleXposition >= (rectXposition - 30) && 
   circleXposition <= (rectXposition + 50)) && 
   (circleYposition >= (rectYposition - 10) && 
   circleYposition <= (rectYposition + 70)) && 
   (directionX < 0) ){
      directionX *= -1;
   }
   if((circleXposition >= (secondRectXposition - 50) && 
   circleXposition <= (secondRectXposition + 30)) && 
   (circleYposition >= (secondRectYposition - 10) && 
   circleYposition <= (secondRectYposition + 70)) && 
   (directionX > 0) ){
      directionX *= -1;
   }
   //Check for GameOver State
   if(playerscore1 >= gameover){
     winner = 1;
     ProgramState = 4; //Game Over State
   }
   else if(playerscore2 >= gameover){
      winner = 2;
      ProgramState = 4; //Game Over State
  }
  //Move Player 1 and 2 objects
  moveRects();
}

/////////////////////////////////////////////
/// ProgramState = 3
/////////////////////////////////////////////
void PauseMenu(){
    if (pause == true){
      pause = false;
      pauseXdirection = directionX; //Save X position of ball
      pauseYdirection = directionY; //Save Y position of ball
      directionX = 0;
      directionY = 0;
      pauseSpeed = speed;
      speed = 0;
    }
    
    image(player1, rectXposition,rectYposition,rectWidth,rectHeight); //rectXposition and rectYposition define the UPPER LEFT CORNER
    image(player2, secondRectXposition,secondRectYposition,rectWidth,rectHeight); //rectXposition and rectYposition define the UPPER LEFT CORNER  
    image(myImage,circleXposition,circleYposition, 100,50);
    player1 = loadImage(player1Array[player1Option]);
    player2 = loadImage(player2Array[player2Option]);
    
    //Player 1 score
    fill(255);
    textSize(28);
    text(playerscore1,50,50);
    
    //Player 2 score
    fill(255);
    textSize(28);
    text(playerscore2,width-50,50);
    stroke(255);
    fill(255);
    
    // Title Text
    fill(0);
    textSize(36);
    text("Game Paused", x_Title + 30, y_Title + 30);
    
    // ResumeGame Button
    
    if(overResumeGameFlag){
      stroke(0);
      fill(255);
      rect(x_ResumeGame, y_ResumeGame, width_ResumeGame, height_ResumeGame, buttonRadius);
      fill(0);
      textSize(20);
      text("Resume Game", x_ResumeGame + 10, y_ResumeGame + 32);
    }
    else{
      fill(0); //Text colour
      rect(x_ResumeGame, y_ResumeGame, width_ResumeGame, height_ResumeGame, buttonRadius);
      fill(255);//Start Button Colour
      textSize(20);
      text("Resume Game", x_ResumeGame + 10, y_ResumeGame + 32);
    }
      
    // Main Menu Button
    if(overMainMenuFlag){
      fill(255);
      stroke(0);
      rect(x_MainMenu, y_MainMenu , width_MainMenu , height_MainMenu, buttonRadius);
      fill(0);
      textSize(20);
      text("Main Menu", x_MainMenu + 24, y_MainMenu + 32);
    }
    else{
      fill(0); //Text colour
      rect(x_MainMenu, y_MainMenu , width_MainMenu , height_MainMenu, buttonRadius);
      fill(255);//Start Button Colour
      textSize(20);
      text("Main Menu", x_MainMenu + 24, y_MainMenu + 32);
    }
    
    // Restart Game Button
    if(overRestartButtonFlag){
      stroke(0);
      fill(255);
      rect(x_RestartGame, y_RestartGame, width_RestartGame, height_RestartGame, buttonRadius);
      fill(0);
      textSize(20);
      text("Restart Game", x_RestartGame + 10, y_RestartGame + 32);
    }
    else{
      fill(0); //Text colour
      rect(x_RestartGame, y_RestartGame, width_RestartGame, height_RestartGame, buttonRadius);
      fill(255);//Start Button Colour
      textSize(20);
      text("Restart Game", x_RestartGame + 10, y_RestartGame + 32);
    }
    
    // Update Mouse Position
    updateMouse(mouseX, mouseY);
      
}

void ResumeGame(){
    if(pause == false){
      directionX = pauseXdirection;
      directionY = pauseYdirection;
      speed = pauseSpeed;
      return;
    }
}


/////////////////////////////////////////////
/// ProgramState = 4
/////////////////////////////////////////////
void GameOver(){
  ResetPositions();
  
  // Title Text
  fill(0);
  textSize(36);
  text("Game Over", x_Title + 50, y_Title + 30);
  
  if(winner == 1){
  fill(255,0,0);
  text("Player 1 Wins!", x_Title + 30, y_Title + 80);
  }
  else if (winner == 2){
  fill(0,0,255);
  text("Player 2 Wins!", x_Title + 30, y_Title + 80);
  } 
  
  image(player1, rectXposition,rectYposition,rectWidth,rectHeight); //rectXposition and rectYposition define the UPPER LEFT CORNER
  image(player2, secondRectXposition,secondRectYposition,rectWidth,rectHeight); //rectXposition and rectYposition define the UPPER LEFT CORNER  
  image(myImage,circleXposition,circleYposition, 100,50);
  player1 = loadImage(player1Array[player1Option]);
  player2 = loadImage(player2Array[player2Option]);
  
  //Player 1 score
  fill(255);
  textSize(28);
  text(playerscore1,50,50);
  
  //Player 2 score
  fill(255);
  textSize(28);
  text(playerscore2,width-50,50);
  stroke(255);
  fill(255);
  
  // Main Menu Button
  if(overMainMenuFlag){
    fill(255);
    stroke(0);
    rect(x_MainMenu, y_MainMenu , width_MainMenu , height_MainMenu, buttonRadius);
    fill(0);
    textSize(20);
    text("Main Menu", x_MainMenu + 24, y_MainMenu + 32);
  }
  else{
    fill(0); //Text colour
    rect(x_MainMenu, y_MainMenu , width_MainMenu , height_MainMenu, buttonRadius);
    fill(255);//Start Button Colour
    textSize(20);
    text("Main Menu", x_MainMenu + 24, y_MainMenu + 32);
  }
  
  // Restart Game Button
  if(overRestartButtonFlag){
    stroke(0);
    fill(255);
    rect(x_RestartGame, y_RestartGame, width_RestartGame, height_RestartGame, buttonRadius);
    fill(0);
    textSize(20);
    text("Restart Game", x_RestartGame + 10, y_RestartGame + 32);
  }
  else{
    fill(0); //Text colour
    rect(x_RestartGame, y_RestartGame, width_RestartGame, height_RestartGame, buttonRadius);
    fill(255);//Start Button Colour
    textSize(20);
    text("Restart Game", x_RestartGame + 10, y_RestartGame + 32);
  }
  
  // Update Mouse Position
  updateMouse(mouseX, mouseY);

}

void ResetPositions(){
  rectXposition = 50;
  rectYposition = 100;
  secondRectXposition = 520;
  secondRectYposition = 100;
  circleXposition = 100;
  circleYposition = 60;
}

/////////////////////////////////////////////
/// General Functions for Processing
/////////////////////////////////////////////
void keyPressed(){
  if(key != ENTER && pause == true){
    return;
  }
  if(key=='s' || key=='S'){
    leftRectDOWN = true;
  }
  else if(key=='w'|| key=='W'){
    //rectYposition -= 10;
    leftRectUP = true;
  }
  else if(key == 'a' || key=='A'){
    leftRectLEFT = true;

  }
  else if(key == 'd' || key=='D'){
    leftRectRIGHT = true;

  }
  else if(keyCode== UP){
    //secondRectYposition -= 10;
    rightRectUP = true;
  }
  else if(keyCode== DOWN){
    //secondRectYposition += 10;
    rightRectDOWN = true;
  }
  else if(keyCode == RIGHT){
    rightRectRIGHT = true;
  }
  else if(keyCode == LEFT){
    rightRectLEFT = true;
  }
  if(key == ENTER){
    if(ProgramState == 2){
      pause = true;
      ProgramState = 3;
    }
    else if(ProgramState == 3){
      ResumeGame();
      ProgramState = 2;
    }
  }
}
 
void keyReleased(){
  if(key=='s'|| key=='S'){
    //rectYposition += 10;
    leftRectDOWN = false;
  }
  else if(key=='w'|| key=='W'){
    //rectYposition -= 10;
    leftRectUP = false;
  }
  else if(key == 'a' || key=='A'){
    leftRectLEFT = false;
  }
  else if(key == 'd' || key=='D'){
    leftRectRIGHT = false; 
  }
  else if(keyCode==UP){
    //secondRectYposition -= 10;
    rightRectUP = false;
  }
  else if(keyCode==DOWN){
    //secondRectYposition += 10;
    rightRectDOWN = false;
  }
  else if(keyCode == RIGHT){
    rightRectRIGHT = false;
  }
  else if(keyCode == LEFT){
    rightRectLEFT = false;
  }
}

void moveRects(){
  if(pause == true){
    return;
  }
  if(leftRectUP==true && rectYposition>0){
    rectYposition -= playerspeed;
  }
  else if(leftRectDOWN == true && rectYposition<height-rectHeight){
    rectYposition += playerspeed;
  }
  if (leftRectRIGHT == true && rectXposition < 100){
    rectXposition += playerspeed;
  }
  else if(leftRectLEFT == true && rectXposition > 0){
    rectXposition -= playerspeed;
  }
  if(rightRectUP==true  && secondRectYposition > 0){
    secondRectYposition -= playerspeed;
  }
  else if(rightRectDOWN==true  && secondRectYposition<height-rectHeight){
    secondRectYposition += playerspeed;
  }
  else if(rightRectRIGHT == true && secondRectXposition < 540){
    secondRectXposition += playerspeed;
  }
  else if(rightRectLEFT == true && secondRectXposition > 440){
    secondRectXposition -= playerspeed;
  }
}
