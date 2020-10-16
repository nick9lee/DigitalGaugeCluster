class FuelComputer
{
double FuelEconomy;
double DistanceTravelled;
double ConsumedFuel;
double Averagefuelecon;
 
 double  getfuelecon(double distravel, double confuel)
 {
  return distravel/confuel;  
 }
  
 double get60( FloatList first60)
 {
  double sum = 0;
  int count = 0;
  
  for(int i = 1; i < 40; i++)
  {
   sum += first60.get(i);
   count++;
  }
  return sum /count;
 }
   
 double getAverage(FloatList babablacksheep)
 {
  int sum = 0;
  int count = 0;
     
  for(int i = 0; i < babablacksheep.size(); i++)
  {
   sum+= babablacksheep.get(i);
   count++;
  }
  return sum/count;
 }
  
  double getrangedata(double avgecon,double remfuel)
  {
   return avgecon * remfuel;
  }
  
  double getFuelConsumption(double AverageFuelEcon)
  {
   return (1/AverageFuelEcon) * 100; 
  } 
}
