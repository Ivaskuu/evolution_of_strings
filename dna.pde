import java.util.Random;

class DNA
{
  char[] genes;
  double fitness;
  
  DNA()
  {
    fitness = 0;
  }
  
  DNA(int genesNum)
  {
    fitness = 0;
    genes = new char[genesNum];
    
    Random r = new Random();
    for(int i = 0; i < genesNum; i++)
    {
      genes[i] = getRandomChar(r);
    }
  }
  
  void createFromParents(DNA parent1, DNA parent2)
  {
    Random r = new Random();
    int luogoDivisione = r.nextInt(parent1.genes.length);
    int genesNum = parent1.genes.length;
    boolean parent1First;
    
    genes = new char[genesNum];
    
    if(r.nextInt(100) < 50) parent1First = true;
    else parent1First = false;
    
    for(int i = 0; i < genesNum; i++)
    {
      if(i < luogoDivisione)
      {
        if(parent1First) genes[i] = parent1.genes[i];
        else genes[i] = parent2.genes[i];
      }
      else
      {
        if(parent1First) genes[i] = parent2.genes[i];
        else genes[i] = parent1.genes[i];
      }
    }
  }
  
  char getRandomChar(Random r)
  {
    char randomChar = (char)(r.nextInt(61) + '@');
    if(randomChar == '@') randomChar = ' ';
    
    return randomChar;
  }
  
  double calculateFitness(String target)
  {
    fitness = 0;
    for(int i = 0; i < genes.length; i++)
    {
      if(genes[i] == target.charAt(i))
      {
        fitness++;
      }
    }
    fitness /= target.length();
    return fitness;
  }
  
  String getGenesString()
  {
    String genesString = "";
    for(int i = 0; i < genes.length; i++)
    {
      genesString += genes[i];
    }
    
    return genesString;
  }
  
  void mutate()
  {
    Random r = new Random();
    int rand = r.nextInt(105);
    
    if(rand < 40) // Mutate 1 gene
    {
      genes[r.nextInt(genes.length)] = getRandomChar(r);
    }
    else if(rand < 70) // Mutate a random number of genes
    {
      int genesToMutate = r.nextInt(genes.length);
      for(int i = 0; i < genesToMutate; i++) genes[r.nextInt(genes.length)] = getRandomChar(r);
    }
    else if(rand < 90) // Split the genes and rearrange the 2 pieces
    {
      int middle = r.nextInt(genes.length);
      String completeGene = getGenesString().substring(middle, genes.length) + getGenesString().substring(0, middle);
      
      genes = completeGene.toCharArray();
    }
    else if(rand < 100) // Reverse the order of the genes
    {
      int genesLength = genes.length;
      
      for(int i = 0; i < genesLength / 2; i++)
      {
        char temp = genes[i];
        genes[i] = genes[(genesLength - i) - 1];
        genes[(genesLength - i) - 1] = temp;
      }
    }
    else // Mutate all genes
    {
      for(int i = 0; i < genes.length; i++) genes[r.nextInt(genes.length)] = getRandomChar(r);
    }
  }
}