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
  
  double cumulativeFitness;
  double[] elementsFitness;
  
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
    DNA[] elementsCopy = elements;
    
    for(int i = 0; i < popNum; i++)
    {
      int parent1Pos = binarySearch(cumulativeFitness * r.nextDouble());
      DNA parent1 = elementsCopy[parent1Pos];
      
      int parent2Pos = binarySearch(cumulativeFitness * r.nextDouble());
      DNA parent2 = elementsCopy[parent2Pos];
      
      elements[i] = new DNA();
      elements[i].createFromParents(parent1, parent2);
    }
    
    generation++;
  }
  
  void prepareTheMatingPool()
  {
    elementsFitness = new double[popNum];
    cumulativeFitness = 0;
    
    for(int i = 0; i < popNum; i++)
    {
      cumulativeFitness += Math.pow(elements[i].fitness, 2); // ^4 gives the best elements even more chance of being selected;
      elementsFitness[i] = cumulativeFitness;
    }
  }
  
  int binarySearch(double value)
  {
    int lPos = 0;
    int rPos = popNum - 1;
    int middle;
    
    if(value < elementsFitness[0]) return 0;
    else if(value <= elementsFitness[popNum-1] && value > elementsFitness[popNum-2]) return popNum - 1;
    
    while(true)
    {
      middle = (lPos + rPos) / 2;
      
      if(value >= elementsFitness[middle - 1] && value <= elementsFitness[middle])
      {
        return middle;
      }
      else if(value < elementsFitness[middle])
      {
        rPos = middle;
      }
      else if(value > elementsFitness[middle])
      {
        lPos = middle;
      }
      else
      {
        println("wtf");
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