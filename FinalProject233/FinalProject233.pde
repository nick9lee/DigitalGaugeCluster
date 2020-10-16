SensorDataProvider A = new SensorDataProvider();
Car car = new Car();//creating an object of class car
Gauge H = new Gauge();
FuelComputer fueldata = new FuelComputer(); 
int fuel_index = 1;
int fuel_econ_averageindex = 1;
int fuel_economy_index = 1;
int fuel_consumption_index = 1;
FloatList fuel_values = new FloatList();
FloatList fuel_econ_average = new FloatList();
FloatList fuel_economy = new FloatList();
FloatList fuel_consumption = new FloatList();
float [] fuel_chart = new float[41];
float [] consumptionChart = new float [41];
double Range = 2445;
double Fuel_Consumption;
double displayFuelEconomy;
boolean startup = true;
boolean repeat = true;
String a;
import org.gicentre.utils.stat.*;

void setup()
{
 size(displayWidth,displayHeight);
 background(0); 
}

void draw()
{
 {
  {
   if(startup)
   {
    background(0);
    fill(255);
    textSize(displayHeight/20);
    text("1. Car", displayWidth/100 * 45, displayHeight/100 * 45);
    text("2.Truck", displayWidth/100 * 45, displayHeight/100 * 50);
    text("3.Quit Program", displayWidth/100 * 45, displayHeight/100 * 55);
   
    if(keyPressed)
    {
     if(key == '1')
     {
      a =  "car_status_BMW_323i.csv";
      A.Initialize();
      startup = false;
     }
     else if(key == '2')
     {
      a= "car_status_Truck_F150.csv";
      A.Initialize();
      startup = false; 
     }
     else if(key == '3')
     {
      exit();
     }     
    }
   }
  else
  {
  frameRate(25);
  A.readNext();
  fuel_values.set(fuel_index,(float) A.readFuelLevel()); // reading the floatlist of the fuel_level
  car.processInput(A.readRPM(), A.readRatio(),A.readFuelLevel()); //sending the rpm and gear_ratio values to car
  H.Createscreen(displayWidth,displayHeight);
  H.MovingGauges(displayWidth,displayHeight); 
  
 if( fuel_economy_index < 40 && fuel_consumption_index < 40) // fueldata = FuelComputer
 {
  fuel_economy.set(fuel_economy_index, (float)((fueldata.getfuelecon(car.tripcomputer.getCurrentSpeedKMH()/1000,(fuel_values.get(fuel_index-1)-fuel_values.get(fuel_index))) )));// calculating fuel_economy of the car
  displayFuelEconomy = fuel_economy.get(fuel_economy_index);
  
 if(fuel_economy.size() > 20) // if the size of the floatlist is greater than 5, calculate the average and use that to get the range and fuel consumption.
 {
  Range =fueldata.getrangedata(fueldata.getAverage(fuel_economy),car.carfuel.remaining());
  Fuel_Consumption = fueldata.getFuelConsumption((fueldata.getAverage(fuel_economy)));
  fuel_consumption.set(fuel_consumption_index, (float)(Fuel_Consumption));
  fuel_consumption_index++;
 } 
  fuel_economy_index++;
 }

 else
 {
  fuel_econ_average.set(fuel_econ_averageindex,(float) fueldata.get60(fuel_economy));
  Range = fueldata.getrangedata(fuel_econ_average.get(fuel_econ_averageindex),car.carfuel.remaining());
  Fuel_Consumption = fueldata.getFuelConsumption((fueldata.get60(fuel_economy))); 
  fuel_economy_index = 1;
  fuel_economy.clear();
  fuel_econ_averageindex++;
  fuel_consumption_index = 1;
 }
 
for(int i = 1; i < fuel_economy_index; i++)
 {
  fuel_chart[i] = fuel_economy.get(i); 
 }
for(int i = 1; i < fuel_consumption_index; i++)
 {
  consumptionChart[i] = fuel_consumption.get(i); 
 }

BarChart barChart;
barChart = new BarChart(this);
barChart.setData(fuel_chart);
barChart.setMinValue(0);
barChart.setMaxValue(140);
textFont(createFont("serif",10),10);
barChart.showValueAxis(true);
barChart.setValueFormat("#");
barChart.showCategoryAxis(true);
barChart.setBarColour(color(70,150,255,220)); //(70,150,255)
barChart.setBarGap(10);
barChart.draw((displayWidth/100) * 25,(displayHeight/100) * 72,600,300);
textSize(35);
text("Average Fuel Economy vs time (Km/L sec)",(displayWidth/100) * 25,(displayHeight/100) * 71);
fuel_index++;

BarChart consumpChart;
consumpChart = new BarChart(this);
consumpChart.setData(consumptionChart);
barChart.setMinValue(0);
barChart.setMaxValue(50);
textFont(createFont("serif",10),10);
barChart.showValueAxis(true);
barChart.setValueFormat("#");
barChart.showCategoryAxis(true);

barChart.setBarColour(color(70,150,255,220));
barChart.setBarGap(10);
barChart.draw((displayWidth/100) * 60,(displayHeight/100) * 72,600,300);

textSize(35);
text("Average Fuel Consumption vs time (L/sec)",(displayWidth/100) * 60,(displayHeight/100) * 71);

} // ------------------------------------------------ 
  }
 }
}
