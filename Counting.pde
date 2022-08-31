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
final int BG_COLOR = #19323C;
final int NUMBER_LENGTH = 5;
final int TEXT_SIZE = 40;
final int SPEED = 60;
final int BINARY_COLOR = #3B8EA5;
final int OCTAL_COLOR = #97D8B2;
final int DECIMAL_COLOR = #EEE5E9;
final int HEX_COLOR = #81667A;


// Global Variables
int counter;
ParticleSystem binary_ps, hex_ps, octal_ps, decimal_ps;
float binary_x, octal_x, decimal_x, hex_x;
float title_y;


void setup() {
  size(1080, 1080);
  pixelDensity(displayDensity());
  frameRate(60);
  
  textAlign(CENTER, CENTER);
  textSize(TEXT_SIZE);
  
  counter = 0;
  
  binary_x = width/5;
  octal_x = width*2/5;
  decimal_x = 3*width/5;
  hex_x = 4*width/5;
  title_y = height/5;
  
  binary_ps = new ParticleSystem(new PVector(binary_x, title_y + textAscent()), BINARY_COLOR);
  hex_ps = new ParticleSystem(new PVector(hex_x, title_y + textAscent()), HEX_COLOR);
  octal_ps = new ParticleSystem(new PVector(octal_x, title_y + textAscent()), OCTAL_COLOR);
  decimal_ps = new ParticleSystem(new PVector(decimal_x, title_y + textAscent()), DECIMAL_COLOR);
  
  
} // End of setup()
  
  
void draw() {
  background(BG_COLOR);
  drawTitles();
  
  int display_number = counter/SPEED;
  
  String binary_text = binary(display_number, NUMBER_LENGTH);
  String hex_text = hex(display_number, NUMBER_LENGTH);
  String octal_text = decimalToOctal(display_number);
  String decimal_text = nf(display_number, NUMBER_LENGTH);
  
  fill(DECIMAL_COLOR);
  text(decimal_text, decimal_x, title_y + textAscent());
  
  fill(BINARY_COLOR);
  text(binary_text, binary_x, title_y + textAscent());
  
  fill(OCTAL_COLOR);
  text(octal_text, octal_x, title_y + textAscent());
  
  fill(HEX_COLOR);
  text(hex_text, hex_x, title_y + textAscent());
  
  
  counter++;
  if (counter % SPEED == 0){
    binary_ps.addParticle(binary_text);
    hex_ps.addParticle(hex_text);
    octal_ps.addParticle(octal_text);
    decimal_ps.addParticle(decimal_text);
  }
  binary_ps.run();
  hex_ps.run();
  octal_ps.run();
  decimal_ps.run();

} // End of draw()

void drawTitles() {
  fill(#A17C6B);
  //fill(DECIMAL_COLOR);
  text("Decimal", decimal_x, title_y);
  //fill(BINARY_COLOR);
  text("Binary", binary_x, title_y);
  //fill(OCTAL_COLOR);
  text("Octal", octal_x, title_y);
  //fill(HEX_COLOR);
  text("Hexadecimal", hex_x, title_y);
  
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
