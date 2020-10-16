class SensorDataProvider
{
  Table dataTable;
  int currentIndex = -1;
  String filePath = " ";
  TableRow row;
  PImage img;

  void Initialize()
  {
 //  filePath =  "car_status_Truck_F150.csv" ;
   // if(filePath ==  "car_status_Truck_F150.csv" || filePath == "car_status_BMW_323i.csv")
    {
    filePath = a;
   dataTable = loadTable(filePath, "header");
  if( a ==  "car_status_Truck_F150.csv")
   {
   img = loadImage("Ford.jpg");
   }
   else
   {
     img = loadImage("BMW.png");
     
   }
    }
  
   //row = dataTable.getRow(500);
   //println(row.getInt("RPM"));
  }
  void readNext() //each time its called it advances to the next line
  // remember if object is created in draw function it will reset to 0
  {
    if (currentIndex < 599)
    {
     currentIndex ++;
    }
    else 
    {
      car.tripcomputer.distance=0;
     currentIndex = 0;
     startup = true;
     //currentIndex = -80; // use exit() to end
    }
  }
  int readTime()
  {
    row = dataTable.getRow(currentIndex);
    return row.getInt("Time");
    
  }
  int readRPM()
  {
    row = dataTable.getRow(currentIndex);
    return row.getInt("RPM");
  }
  double readFuelLevel()
  {
   row = dataTable.getRow(currentIndex);
   return row.getDouble("Fuel Level (liter)");
  }
  double readRatio()
  {
   row = dataTable.getRow(currentIndex);
   return row.getDouble("Gear Ratio");
  }
  double readX()
  {
   row = dataTable.getRow(currentIndex);
   return row.getDouble("X");
  }
  double readY()
  {
   row = dataTable.getRow(currentIndex);
   return row.getDouble("Y");
  }
}
