// KSP font generator
// 2024.5.3 aike
// MIT License

String fontname = "Arial-Black-60";

int fontHeight    = 60;
int margin_top    = 0;
int margin_bottom = 20;
int margin_left   = 0;
int margin_right  = 0;

PFont font = loadFont(fontname + ".vlw");

// calc canvas size
textFont(font);
int x = 0;
for (int i = 0; i < 256; i++) {
  int fontWidth;
  if ((i >= 32) && (i <= 126)) {
    fontWidth = int(textWidth(char(i))) + margin_left + margin_right;
  } else {
    fontWidth = 1;
  }
  x += fontWidth;
}

PGraphics g;
g = createGraphics(x + 4, fontHeight + margin_top + margin_bottom);
g.beginDraw();

// clear background
g.background(0,0,0,0);

g.textFont(font);
x = 0;
for (int i = 0; i < 256; i++) {
  int fontWidth;
  if ((i >= 32) && (i <= 126)) {
    // draw text
    fontWidth = int(textWidth(char(i))) + margin_left + margin_right;
    g.noStroke();
    g.fill(0,0,0);
    g.text(char(i), x + margin_left, fontHeight + margin_top);
  } else {
    // skip no printable characters
    fontWidth = 1;
  }

  // draw red pixel
  g.strokeWeight(1);
  g.noStroke();
  g.fill(255,0,0);
  g.rect(x, 0, 1, 1);

  x += fontWidth;
}

g.endDraw();
g.save(fontname + ".png");

// generate metafile
PrintWriter file = createWriter(fontname + ".txt");
file.print("Has Alpha Channel: yes\n");
file.print("Number of Animations: 1\n");
file.print("Horizontal Animation:  no\n");
file.print("Vertical Resizable: no\n");
file.print("Horizontal Resizable: no\n");
file.print("Fixed Top: 0\n");
file.print("Fixed Bottom: 0\n");
file.print("Fixed Left: 0\n");
file.print("Fixed Right:  0\n");
file.flush();
file.close(); 

exit();
