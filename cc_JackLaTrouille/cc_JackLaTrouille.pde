PImage background;
ArrayList<Orb> my_orbs;

long time_counter;
int score = 0;
int max_score = 0;

//__Main__():
void setup()
{
  size(1200, 720);
  background = loadImage("/Users/yann/Documents/GitHub/cc_jack_la_trouille/cc_JackLaTrouille/ressources/Images/training_background.png");
  my_orbs = new ArrayList();
  time_counter = millis();
}

void draw()
{
  clear();
  image(background, 0, 0);
  spawn();
  
    // chaque orbe est géré séparément
  for (int i = 0; i < my_orbs.size(); i++) {
    if (my_orbs.get(i).is_alive() == 0) {
      my_orbs.get(i).move();
      my_orbs.get(i).display();
    }
    else {
      if (my_orbs.get(i).is_alive() == 1){
        if (score > 0){
          score -= 1;}
        else {
          exit();
        }}
      else{
         score += 1;
      } 
     my_orbs.remove(i);
     i--;
    }
  }
  
  textSize(60);
  text(str(score), 40, 60);
  if (score > max_score) {
    max_score = score;
  }
  textSize(40);
  text("Max score " + str(max_score), 40, 100);
}

void spawn() {
  if (time_counter <= millis()) {
    my_orbs.add(new Orb());
    time_counter = millis() + 1000;
}
}

void mousePressed()
{
  if (mouseButton == LEFT) {
    for (int i = 0; i < my_orbs.size(); i += 1) {
      my_orbs.get(i).click();
    }
  }
}
