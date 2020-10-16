class Car
{
 TripComputer tripcomputer = new TripComputer();//creating a new tripcomputer object
 FuelTank carfuel = new FuelTank();
  
 void processInput(int rpm, double gear_ratio,double Fuel_Level) //remember processinput was called in draw, and the rpm and gear_ratio have been given to this function
 {
  tripcomputer.setRPM(rpm);//sending rpm values to tripcomputer
  tripcomputer.setGearRatio(gear_ratio);//sending gear_ratio values to tripcomputer
  carfuel.setFuelLevel(Fuel_Level);
 }
}
