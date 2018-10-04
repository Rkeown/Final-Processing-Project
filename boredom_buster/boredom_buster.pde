
//==INTS Start==
int clicks = 0;
int displayedClicks = 0;
int buttonSizeWidth = 300;
int buttonSizeHeight = 100;
int speed = 5;
//the "health" of the bag
int bag = 0;
//how many bags destroyed
int bags = 0;



//==INTS End==

//==Booleans Start==
boolean buttonClicked = false;
boolean Punching = false;
boolean gameStart = true;
boolean EE = false;
boolean partyMode = false;
//==Booleans End==

//Stick man sprites
PImage notPunch;
PImage punch;
//Punching bag spites
PImage goodBag;
PImage kindaBag;
PImage prettyBag;
PImage dedBag;
//boxing ring
PImage boxingRing;
//backgroundy things
PImage poster1;
//fan
PImage fan1;
PImage fan2;
//fan blade coordinates
float spin = 0;


void setup()
{
 imageMode(CENTER);
  
  fullScreen();
  rectMode(CENTER);
  noStroke();
  //Loading all the images to be called upon later
  notPunch = loadImage("New Piskel.png");
  punch = loadImage("New Piskel (1).png");
  goodBag = loadImage("New Piskel (2).png");
  kindaBag = loadImage("kindaded.png");
  prettyBag = loadImage("prettyded.png");
  dedBag = loadImage("ded.png");
  boxingRing = loadImage("boxingring.png");
  poster1 = loadImage("timethis.png");
  fan1 = loadImage("fan1.png");
  fan2 = loadImage("fan2.png");
  
}
void draw()
{
  background(#9D3939);
  fill(#666666);
  
  if(partyMode == true)
  {
    background(random(255),random(255),random(255));
  }
  
  //==Background Start==
  rect(1600, 700,5,5);
  rect(width/2, 1600, width, 500);
  image(poster1,1500,600,300,300);
 
  image(fan1,700,700,384,384);
 //Makes the fan blade spin
  pushMatrix();
  translate(685,700);
  rotate(spin);
  image(fan2,0,0,100,100);
  resetMatrix();
  popMatrix();
  spin = spin + 1;
 
  
  //window1
 
  //==Background End==
  
  
  //==Button Display Start==
  //clicker button
  fill(#CB480A);
  rect(2000, 1500, buttonSizeWidth,buttonSizeHeight,50);
  fill(0);
  //Punch text in button
  textSize(70);
  text("PUNCH",1870 , 1530);
  textSize(200);
  text(displayedClicks,width/2, 300);
  //==Button Display End==
  
  
  //==Growing Animation Start==
  // grow and shrink effect on button
  if(buttonClicked == true)
  {
    buttonSizeWidth = buttonSizeWidth + speed;
    buttonSizeHeight = buttonSizeWidth + speed;
  }
 //tells program to shrink button
 if(buttonSizeWidth >= 330 && buttonSizeHeight >= 130)
 {
   speed = speed * -1;  
 }
 if(buttonSizeWidth < 300)
 {
   buttonSizeWidth = 300;
   buttonSizeHeight = 100;
   buttonClicked = false;
   speed = speed * -1; 
   //piggy backs of the grow and shrink to change the punch sprite
   Punching = false;
 }
 //==Growing Animation End==
 
    //==Punching Animation Start==
    
    //Tells the program to display the idle sprite
    if(Punching == false)
    {
      image(notPunch,100 ,height/2,500,600);
    }
    //Tells the program to diplay the action sprite
    if(Punching == true)
    {
      image(punch, 100 ,height/2,500,600);
    }
    //==Punching Animation End==
    //Loads the boxing ring in
    image(boxingRing,1500,700,1000,1000);
    
    //==Control For Changing The Bag Damage Start==
    if( bag == 0)
    {
      image(goodBag,210,height/2 -50,500,600);
    }
    if( EE == true)
    {
      text("who told you the input?",100 ,height/2);
    }
    if(clicks >= 50)
    {
      bag = 1;
    }
    if(bag == 1)
    {
      image(kindaBag,210,height/2 -50,500,600);
    }
    if(clicks >= 75)
    {
      bag = 2;
    }
    if(bag == 2)
    {
      image(prettyBag,210,height/2 -50,500,600);
    }
    if(clicks >= 100)
    {
      bag = 3;
    }
    if(bag == 3)
    {
      image(dedBag,210,height/2 -50,500,600);
    }
    if(clicks >= 110)
    {
      bags = bags + 1;
    }
    //==Control For Changing The Bag Damage End==
    if(clicks >= 110)
    {
      clicks = 0;
      bag = 0;
    }
    //==New Bag Start==
    if (clicks == 0 && gameStart == false)
    {
      text("NEW BAG",width/2,height/2);
    }
    //==New Bag End==
    
    //==Bag Counter Start==
    textSize(70);
    text(bags,1000,500);
    text("bags:",800,500);
    //==Bag Counter Start==
    

    
}

void mouseClicked()
{
  if (mouseX > 1800 && mouseX < 2200 && mouseY > 1400 && mouseY < 1600)
  {
    buttonClicked = true;
    clicks = clicks + 1;
    displayedClicks = displayedClicks + 1;
    Punching = true;
    gameStart = false;
    EE = false;
  }
  if(mouseX > 1350 && mouseX <1650 && mouseY > 450 && mouseY < 750)
  {
    partyMode = true;
  }
  
}
void keyPressed()
{
  if(key == 'm')
  {
    EE = true;
  }
}



/**
* My 7 images are: The stick man and his punching sprite,
*the four states of the punching bag, and the boxing ring, and the poster.
*
*Rotating fan blade/https://player.vimeo.com/video/69758190
*
*I knew stop motion so I made a super simple 2 frame punching animation,
the changing states of the punching bag, grow and shrink of the button(explained by mr hardman),
and the partyMode when the poster is clicked
*
*if m is pressed a "secret" message will appear
*
*if the mouse clicks in a certain spot in screen the counter goes up,
the punch will animation change, and if the poster is clicked partyMode will be activated.
*/
