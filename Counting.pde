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
final int NUMBER_LENGTH = 5;
final int TEXT_SIZE = 40;
final int SPEED = 60;


// Global Variables
int counter;
ParticleSystem binary_ps, hex_ps, octal_ps;
Babylonian babylonian;


void setup() {
  size(1080, 1080);
  pixelDensity(displayDensity());
  frameRate(60);
  
  textAlign(CENTER, CENTER);
  textSize(TEXT_SIZE);
  
  counter = 0;
  
  binary_ps = new ParticleSystem(new PVector(width/5, height/2 + textAscent()));
  hex_ps = new ParticleSystem(new PVector(width*3/5, height/2 + textAscent()));
  octal_ps = new ParticleSystem(new PVector(width*2/5, height/2 + textAscent()));
  babylonian = new Babylonian(5);
  
  
} // End of setup()
  
  
void draw() {
  fill(255);
  background(BG_COLOR);
  drawTitles();
  
  int display_number = counter/SPEED;
  
  String binary_text = binary(display_number, NUMBER_LENGTH);
  String hex_text = hex(display_number, NUMBER_LENGTH);
  String octal_text = decimalToOctal(display_number);
  stroke(255);
  //decimalToBabylonian(display_number, width*4/5, height/2 + textAscent());
  
  text(nf(display_number, NUMBER_LENGTH), width/2, height/5 + textAscent());
  text(binary_text, width/5, height/2 + textAscent());
  text(octal_text, width*2/5, height/2 + textAscent());
  text(hex_text, width*3/5, height/2 + textAscent());
  
  float x = width*4/5;
  float y = height/2+textAscent();
  stroke(255);
  babylonian.drawNumber(14, x, y);
  
  counter++;
  if (counter % SPEED == 0){
    binary_ps.addParticle(binary_text);
    hex_ps.addParticle(hex_text);
    octal_ps.addParticle(octal_text);
  }
  binary_ps.run();
  hex_ps.run();
  octal_ps.run();

} // End of draw()

void drawTitles() {
  text("Decimal", width/2, height/5);
  text("Binary", width/5, height/2);
  text("Octal", width*2/5, height/2);
  text("Hexadecimal", width*3/5, height/2);
  text("Babylonian", width*4/5, height/2);
  
  
} // End of drawTitles()

String decimalToOctal(int d) {
  String octal_string = "";
  //StringList octal = new StringList();
  while (d != 0) {
    //octal.append(d % 8);
    octal_string = str(d % 8) + octal_string;
    d = d / 8;
  }
  
  return nf(int(octal_string), NUMBER_LENGTH);
} // End of decimalToOctal()

void decimalToBabylonian(int d, float x, float y) {
 IntList b = new IntList();
 while (d != 0) {
   b.append(d%60);
   d = d / 60;
 }
 b.reverse();
 println(b);
 for (int i = 0; i < b.size(); i++) {
   babylonian.drawNumber(int(b.get(i)), x, y);
 }
  
}
