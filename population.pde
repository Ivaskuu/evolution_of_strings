import java.util.Random;

class Population
{
  String target;
  double mutRate;
  int popNum;
  
  int generation;
  double medianFitness;
  
  double bestFitness;
  String bestGenes;
  
  DNA[] elements;
  ArrayList<DNA> matingPool;
  
  Population(String stringTarget, double mutationRate, int populationNum)
  {
    target = stringTarget;
    mutRate = mutationRate;
    popNum = populationNum;
    
    generation = 1;
    bestFitness = 0;
    medianFitness = 0;
    
    elements = new DNA[popNum];
    for(int i = 0; i < popNum; i++)
    {
      elements[i] = new DNA(target.length());
    }
  }
  
  void calculatePopFitness()
  {
    bestFitness = 0;
    medianFitness = 0;
    
    for(int i = 0; i < popNum; i++)
    {
      double elementFitness = elements[i].calculateFitness(target);
      medianFitness += elementFitness;
      
      if(elementFitness > bestFitness)
      {
        bestFitness = elementFitness;
        bestGenes = elements[i].getGenesString();
      }
    }
    
    medianFitness /= popNum;
    
    print("\n\nGeneration : " + generation
          + "\nMedian fitness : " + medianFitness
          + "\nBest fitness : " + bestFitness
          + "\nBest genes : \"" + bestGenes + "\"\n");
  }
  
  void reproduce()
  {
    prepareTheMatingPool();
    
    Random r = new Random();
    int matingPoolSize = matingPool.size();
    
    for(int i = 0; i < popNum; i++)
    {
      int parent1Pos = r.nextInt(matingPoolSize);
      DNA parent1 = matingPool.get(parent1Pos);
      
      int parent2Pos = r.nextInt(matingPoolSize);
      DNA parent2 = matingPool.get(parent2Pos);
      
      elements[i] = new DNA();
      elements[i].createFromParents(parent1, parent2);
    }
    
    generation++;
  }
  
  void prepareTheMatingPool()
  {
    matingPool = new ArrayList<DNA>();
    for(int i = 0; i < popNum; i++)
    {
      int chance = (int)(Math.round(elements[i].fitness * 100));
      for(int j = 0; j < chance; j++)
      {
        matingPool.add(elements[i]);
      }
    }
  }
  
  void mutate()
  {
    Random r = new Random();
    
    for(int i = 0; i < popNum; i++)
    {
      if(r.nextDouble() <= mutRate)
      {
        elements[i].mutate();
      }
    }
  }
}