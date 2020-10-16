class FuelTank
{
 
 double Tank_Capacity = 0; 
 double Fuel_Level;
 double Fuel_remaining;
  
 void setFuelLevel(double fuelreadin)
 {
  if(A.filePath == "car_status_Truck_F150.csv")
   Tank_Capacity = 80;
  else
   Tank_Capacity = 60;
  
  Fuel_Level = fuelreadin; // getting fuel_level from class car
 }
   
 double remaining()
 {
  if(A.filePath == "car_status_Truck_F150.csv")
   Tank_Capacity = 80;
  else
   Tank_Capacity = 60;
  
  double x = Tank_Capacity - Fuel_Level; // calculates the amount of fuel used.
  x = Tank_Capacity - x;
  return x;
 } 
 
 double used()
 {
  if(A.filePath == "car_status_Truck_F150.csv")
   Tank_Capacity = 80;
  else
   Tank_Capacity = 60;
   
  return Tank_Capacity - Fuel_Level;
 }
}
