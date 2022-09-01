/*
                           COUNTING
                           --------
   This animation attempts to show the differences between different
   counting/base systems - binary, octal, decimal and hexadecimal. 
   
*/


// Global Constants
final int BG_COLOR = #19323C;
final int NUMBER_LENGTH = 5;
final int TITLE_SIZE = 60;
final int TEXT_SIZE = 40;
final int SPEED = 60;
final int BINARY_COLOR = #3B8EA5;
final int OCTAL_COLOR = #97D8B2;
final int DECIMAL_COLOR = #A17C6B;
final int HEX_COLOR = #81667A;
final int TITLE_COLOR = #EEE5E9;
final String DECIMAL_TITLE = "DECIMAL";
final String BINARY_TITLE = "BINARY";
final String OCTAL_TITLE = "OCTAL";
final String HEX_TITLE = "HEXADECIMAL";
final int X_GAP = 40;


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
  
  float split = (width - 2*X_GAP) / 4;
  
  binary_x = X_GAP + split/2;
  octal_x = X_GAP + 1.5 *split;
  decimal_x = X_GAP + 2.5*split;
  hex_x = X_GAP + 3.5*split;
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
  
  fill(TITLE_COLOR);
  textSize(TEXT_SIZE/2);
  text("(2 Symbols: 0, 1)", binary_x, title_y);
  text("(8 Symbols: 0 - 7)", octal_x, title_y);
  text("(10 Symbols: 0 - 9)", decimal_x, title_y);
  text("(16 Symbols: 0 - 9, A - F)", hex_x, title_y);
  
  stroke(TITLE_COLOR);
  line(decimal_x - textWidth(DECIMAL_TITLE), title_y + textAscent(), decimal_x + textWidth(DECIMAL_TITLE), title_y + textAscent());
  line(binary_x - textWidth(BINARY_TITLE), title_y + textAscent(), binary_x + textWidth(BINARY_TITLE), title_y + textAscent());
  line(octal_x - textWidth(OCTAL_TITLE), title_y + textAscent(), octal_x + textWidth(OCTAL_TITLE), title_y + textAscent());
  line(hex_x - textWidth(HEX_TITLE), title_y + textAscent(), hex_x + textWidth(HEX_TITLE), title_y + textAscent());
  
  
  textSize(TEXT_SIZE);
  //fill(DECIMAL_COLOR);
  text(DECIMAL_TITLE, decimal_x, title_y - textAscent());
  //fill(BINARY_COLOR);
  text(BINARY_TITLE, binary_x, title_y - textAscent());
  //fill(OCTAL_COLOR);
  text(OCTAL_TITLE, octal_x, title_y - textAscent());
  //fill(HEX_COLOR);
  text(HEX_TITLE, hex_x, title_y - textAscent());
  
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
