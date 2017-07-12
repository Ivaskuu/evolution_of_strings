Population pop;

void setup()
{
  String target = "Buongiorno a tutti i ragazzi e le ragazze questo e un test per testare la velocita del programma";
  double mutationRate = 0.01;
  int populationNum = 10000;
  
  if(target.indexOf('é') > 0 || target.indexOf('.') > 0 || target.indexOf(',') > 0)
  {
    print("The program doesn't support the target string");
    System.exit(0);
  }
  
  print("Creating a new population : \n"
        + "Target : \"" + target + "\"\n"
        + "Muation rate : " + (double)Math.round((mutationRate * 100) * 100000d) / 100000d + "%\n"
        + "Population num : " + populationNum + "\n");
  pop = new Population(target, mutationRate, populationNum);
  
  delay(500);
  print("Starting the evolution in...");
  
  delay(1000);
  print("3...");
  
  delay(1000);
  print("2...");
  
  delay(1000);
  print("1...\n");
  
  long startTime = System.currentTimeMillis();
  
  while(pop.bestFitness < 1)
  {
    pop.calculatePopFitness();
    pop.reproduce();
    pop.mutate();
  }
  
  long elapsedTime = System.currentTimeMillis() - startTime;
  
  print("\n\nThe best gene was found in " + ((double)elapsedTime / 1000) + " seconds !");
  exit();
}