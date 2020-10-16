class TripComputer
{
 int rpm;
 double gear_ratio;
 double current_speedKMH;
 double distance;
 double speed;
 
 void setRPM(int RPM)
 {
  rpm = RPM;//setting rpm values of tripcomputer, given by  class Car
 }
  
 void setGearRatio(double Gear_Ratio)
 {   
  gear_ratio = Gear_Ratio;//setting gear_ratio of tripcomputer, given by class Car
 }
 
 double getCurrentSpeedKMH()
 {
  speed = (rpm/60) * (1/gear_ratio) * 2 * PI * 0.254 * 3.6;  
  return speed;
 }
 
 double TotalDistanceTraveled()
 {
  distance+= ((speed/3.6)/1000); 
  return distance;
 }
 double getCurrentKMS()
 {
  return (rpm/60) * (1/gear_ratio) *2 * PI * 0.254 * (1/1000); 
 }
}
