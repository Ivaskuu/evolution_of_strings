Population pop;

void setup()
{
  print("hello");
  pop = new Population("Questa e una frase per provare se l'algoritmo genetico funziona",
            0.02, 5000);
}

void draw()
{
  while(pop.bestFitness < 1)
  {
    pop.calculatePopFitness();
    pop.reproduce();
    pop.mutate();
  }
  
  print("\n\nThe best gene was found !");
  exit();
}