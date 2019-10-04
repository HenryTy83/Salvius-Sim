/*****************************************************************************
    Salvius Sim v1.0









    type horto for an easter egg
    
    
    CREDITS
    
    Progamming: Henry
    Image: Cambrige Latin Course
*****************************************************************************/
PImage bregans;
PImage beam;

int x = 800;
boolean win = false;
float denarii = 0;
float startmoney;
float[] price = {15, 100, 1100, 12000,130000, 1000000};
int[] helpers = {0, 0, 0, 0, 0, 0};

float totalmoney;

void setup() {
  size(600, 400);
  bregans = loadImage("Bregans.jpg");
  beam = loadImage("beam.jpeg");
  noStroke();
};

void draw() {
  background(200);
  fill(0);
  text("PUNCH BREGANS 'CAUSE HE DESERVES IT", 10, 20);
  text("I'll pay you 1 denarii to punch him \n Denarii: " + str(denarii), 20, 250);
  text("The Forum: Pay people to punch the stultus homo \n (dps = denarii per second)", 300, 20);
  
  //shop
  fill(#864D01);
  rect(300, 50, 280, 300);
  rect(25, 300, 125, 100);
  
  fill(0,255,0);
  rect(50, 350, 75, 25);
  
  fill(0);
  text("BUY", 75, 365);
  
  //final helper
  if (denarii < 10000000) {
    text("?????", 75, 325);
  }
  else {
    text("Mr. Moran", 55, 325);
  }
  
  text("1000000", 60, 345);
  
  
  //calculate pps
  float dogpps = helpers[0]*0.1;
  float varpps = helpers[1];
  float lopps = helpers[2]*8;
  float anopps = helpers[3]*47;
  float quinopps = helpers[4]*260;
  float godopps = helpers[5]*1400;
  
  float totalmoney = dogpps + varpps + lopps + anopps + quinopps + godopps;
  
  //forum
  fill(0);
  text("ANGERY DOG: " + price[0], 320, 75);
  text("You have " + helpers[0] + " making " + dogpps + " dps total", 320, 90);
  
  text("VARICA: " + price[1], 320, 125);
  text("You have " + helpers[1] + " making " + varpps + " dps total", 320, 140);
  
  text("LOQUAX: " + price[2], 320, 175);
  text("You have " + helpers[2] + " making " + lopps + " dps total", 320, 190);
  
  text("ANTI-LOQUAX: " + price[3], 320, 225);
  text("You have " + helpers[3] + " making " + anopps + " dps total", 320, 240);
  
  text("QUINTUS: " + price[4], 320, 275);
  text("You have " + helpers[4] + " making " + quinopps + " dps total", 320, 290);
  
  text("CAECILICUS: " + price[5], 320, 325);
  text("You have " + helpers[5] + " making " + godopps + " dps total", 320, 340);
   
  for (int i=0; i<6; i++) {
    fill(0, 255, 0);
    rect(240, 47*i + 75, 50, 25);
    
    fill(0);
    text("BUY", 250, 47*i+90);
  }
  
  image(bregans, 0, 40);

  //win condition/make money
  if (!win) {
    denarii += totalmoney/60;
  }
  
  if (win) {
    fill(#40CAFF);
    image(beam, x, 0);
    
    x-= 10;
  };
  
  //win screen
  if (x < 0) {
    background(random(255),random(255),random(255));
    
    textSize(random(20, 40));
    fill(0);
    text("YOU WIN! \n BREGANS IS DEAD!", width/2 - 40 + random(-20, 20), height/2 + (random(-10, 10)));
    
  };
};

void mouseClicked() {
  //punch bregans
  if (mouseX < 180 && mouseY < 200) {
    denarii+= 1;
  }
  //win the game
  else if (mouseX < 180 && mouseY > 300 && denarii > 1000000) {
    win = true;
  }
  
  //BUY
  for (int i=0; i<6; i++) {
    if (mouseX > 240 && mouseX < 290 && mouseY > 47*i + 75 && mouseY < 47*i + 100) {
        if (price[i] <= denarii) {
          denarii -= price[i];
          price[i] = ceil(price[i] * 1.15);
          helpers[i] ++;           
        }
    }
  }
};

int horto[] = {0, 0, 0, 0, 0};

//easteregg
void keyPressed() {
  horto[4] = horto[3];
  horto[3] = horto[2];
  horto[2] = horto[1];
  horto[1] = horto[0];
  horto[0] = keyCode;
  
  if (horto[0] == 79 && horto[1] == 84 && horto[2] == 82 && horto[3] == 79 && horto[4]==72) {
    denarii = 1000000000;
  }
};
