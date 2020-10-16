class Gauge
{
 float Maximum;
 float Minimum = 0;
 String Units, currentcolumn;
 double lastpositionx = 0;
 double lastpositiony = 0;
 void Createscreen(int x, int y)
 {
  background(0);
  //speed gauge
  stroke(255); //for nice blue (70,150,255)
  strokeWeight(displayHeight / 200);
  strokeCap(SQUARE);
  noFill();
  arc((x/2),(y/6) * 2,(x/6),(x/6),(2 * PI)/3,(7 * PI)/3);
 
  //rpm gauge
  stroke(255);
  strokeWeight(displayHeight / 200);
  strokeCap(SQUARE);
  noFill();
  arc((x/3),(y/50) * 19,(x/8),(x/8),(2 * PI)/3,(7 * PI)/3);
 
  //fuel liter
  stroke(255);
  strokeWeight(displayHeight / 200);
  strokeCap(SQUARE);
  noFill();
  arc((x/3) * 2,(y/50) * 19,(x/8),(x/8),(2 * PI)/3,(7 * PI)/3);
 }
 
 void CalculateMax()
 {
  String [] y = new String [1000];
  y =  A.dataTable.getStringColumn(currentcolumn);
  float [] x = float(y);
  Maximum = max(x);
 }
 
 void MovingGauges(int x, int y)
 { 
  image(A.img,(displayWidth/100) * 44.8,(displayHeight/100) * 5, width / 9, height/10 ); 
  
  fill(255);
  textSize(displayHeight/30);
  text(car.tripcomputer.rpm, (displayWidth/100) * 31 , (displayHeight/100) * 40); // rpm
  text(nf((float)car.carfuel.remaining(),0,2) + "",(displayWidth/100) * 65, (displayHeight/100) * 40); // fuel level
  text(nf((float)car.tripcomputer.getCurrentSpeedKMH(),0,2) + "",(displayWidth/100) * 48, (displayHeight/100) * 35); //speed km/h
  textSize((float)displayHeight/40);
  text("Odometer:   " + nf((float)car.tripcomputer.TotalDistanceTraveled(),0,2) + "  KM", (displayWidth/100) * 25 ,(displayHeight/100) * 60 ); // odometer KM
  text("Fuel_Economy:   " + nf((float)displayFuelEconomy,0,2) + "   KM/L", (displayWidth/100) * 25, (displayHeight/100) * 65);
  text("Range:   " + nf((float)Range,0,2) + "KM", (displayWidth/100) * 55, (displayHeight/100) * 60);
  text("Fuel Consumption:   " +  nf((float) Fuel_Consumption,0,2) + " L/100KM"  , (displayWidth/100) * 55, (displayHeight/100) * 65); 
  
  // gauge text
  textSize(displayHeight/90);
  text("RPM", (displayWidth/100) * 31, (displayHeight/100) * 42); 
  text("Fuel Level", (displayWidth/100) * 65, (displayHeight/100) * 42);
  text("Speed(Km/H)",(displayWidth/100) * 48, (displayHeight/100) * 37);
  
  //speed gauge
  if (A.currentIndex < 90 || A.currentIndex > 510)
  stroke(255,150,90);
  else
  {
  stroke(70,150,255); //for nice blue (70,150,255)
  }
  strokeWeight(displayHeight / 80);
  strokeCap(SQUARE);
  noFill();
  arc((float)(x/2),(float)((y/6) * 2),(float)(x/6),(float)(x/6),((2 * PI)/3),(float)(((2 * PI)/3) + (((((7 * PI)/3) - ((2 * PI)/3)) / 200) *  car.tripcomputer.getCurrentSpeedKMH())));
 
  //rpm gauge
  currentcolumn = "RPM";
  CalculateMax(); 
  strokeWeight(displayHeight / 80);
  strokeCap(SQUARE);
  noFill();
  arc((x/3),(y/50) * 19,(x/8),(x/8),((2 * PI)/3), ((2 * PI)/3) + ((((((7 * PI)/3)-((2 * PI)/3))/Maximum)*car.tripcomputer.rpm)));   
  
  //fuel liter
  strokeWeight(displayHeight / 80);
  strokeCap(SQUARE);
  noFill();
  arc((float)((x/3) * 2) ,(float)((y/50) * 19) ,(float)((x/8)) ,(float)(x/8),((2 * PI)/3),(float)(((2 * PI)/3)+((((((7 * PI)/3)-((2 * PI)/3))/car.carfuel.Tank_Capacity)* 50))));    
  
  //compass
  lastpositionx = A.readX() - lastpositionx;
  lastpositiony = A.readY() - lastpositiony;
  textSize(displayHeight/30);
  fill(255,150,90);//---------------------------------- cool orange
  if(lastpositionx > 0 && lastpositiony > 0) //++
  text("NE", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx < 0 && lastpositiony > 0) // -+
  text("NW", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx > 0 && lastpositiony < 0)// +-
  text("SE", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx < 0 && lastpositiony < 0)// --
  text("SW", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx == 0 && lastpositiony > 0)// 0+
  text("N", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx == 0 && lastpositiony < 0)//0-
  text("S", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx < 0 && lastpositiony == 0)// -0
  text("W", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else if(lastpositionx > 0 && lastpositiony == 0)// +0
  text("E", (displayWidth/100) * 49, (displayHeight/100) * 25);
  else
  text("0", (displayWidth/100) * 49, (displayHeight/100) * 25);  
 } 

}
