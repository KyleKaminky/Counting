/*
                           COUNTING
                           --------
   Description
   
   
   Pseudo Code
   Every half second? update the value
   Decimal at the very top
   other four across the middle
   global variable int counter
   getBinary() (could just be simple binary(counter, num_bits) call instead)
   getOctal() looks like this will need to be it's own function
   getHexadecimal() hex(counter, num) call instead
   getOther() - own function
   maybe morph from one number to other? too complicated
   or flip?
   
   
*/




// Global Constants
final int BG_COLOR = 0;
final int LENGTH = 5;


// Global Variables
int counter;


void setup() {
  size(1080, 1080);
  pixelDensity(displayDensity());
  frameRate(2);
  
  textAlign(CENTER, CENTER);
  
  counter = 0;
  
  
} // End of setup()
  


void draw() {
  background(BG_COLOR);
  drawTitles();
  text(nf(counter, LENGTH), width/2, height/5 + textAscent());
  counter++;

} // End of draw()

void drawTitles() {
  text("Decimal", width/2, height/5);
  text("Binary", width/5, height/2);
  text("Octal", width*2/5, height/2);
  text("Hexadecimal", width*3/5, height/2);
  text("Other", width*4/5, height/2);
  
  
} // End of drawTitles()
