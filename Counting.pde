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


// Global Variables
int counter;
ParticleSystem binary_ps, hex_ps, octal_ps;


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
  
  
} // End of setup()
  


void draw() {
  fill(255);
  background(BG_COLOR);
  drawTitles();
  
  String binary_text = binary(counter/60, NUMBER_LENGTH);
  String hex_text = hex(counter/60, NUMBER_LENGTH);
  String octal_text = decimalToOctal(counter/60);
  
  text(nf(counter/60, NUMBER_LENGTH), width/2, height/5 + textAscent());
  text(binary_text, width/5, height/2 + textAscent());
  text(octal_text, width*2/5, height/2 + textAscent());
  text(hex_text, width*3/5, height/2 + textAscent());
  
  counter++;
  if (counter % 60 == 0){
    binary_ps.addParticle(binary_text);
    hex_ps.addParticle(hex_text);
    octal_ps.addParticle(octal_text);
  }
  binary_ps.run();
  hex_ps.run();
  octal_ps.run();
  println(decimalToOctal(counter/60));

} // End of draw()

void drawTitles() {
  text("Decimal", width/2, height/5);
  text("Binary", width/5, height/2);
  text("Octal", width*2/5, height/2);
  text("Hexadecimal", width*3/5, height/2);
  text("Other", width*4/5, height/2);
  
  
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
