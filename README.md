![warning](http://icons.iconarchive.com/icons/paomedia/small-n-flat/24/sign-warning-icon.png "Warning") Work in progress ![warning](http://icons.iconarchive.com/icons/paomedia/small-n-flat/24/sign-warning-icon.png "Warning")

# Evolution of strings
This is a java (processing) project that simulates the genetic evolution of a string of text.

_It's my first Machine Learning - Artificial Intelligence project, so please be gentle with me :-)._

## Files
The project is composed of 3 files :
- **main.pde** : It creates a population based on the target, the mutation rate and the number of elements, and train it.
- **population.pde** : It manages all the elements, that form the population, cioè a method to train the elements, and method to reproduce them.
- **dna.pde** : It contains the genes of an element, a method to calculate it's fitness, a method to mutate and a method to create an element from 2 parents.

### main.pde
Methods
- **_void_ setup**() : Called once at the start of the program. It creates a new population, then trains it in a while loop.

### population.pde
Methods
- **Population**(**_String stringTarget, double mutationRate, int populationNum_**) : The constructer of the class, it creates a new population with the specified parameters.
- **_void_ calculatePopFitness**() : It calculates the fitness of all elements, and prints the median fitness, best's genes and generation number.
- **_void_ reproduce**() : It creates a new generation of population composed of popNum elements, based on the previous best elements DNA.
- **_void_ prepareTheMatingPool**() : Puts all the elements fitness in a cumulative char array.
- **_int_ binarySearch**(**_double value_**) : Returns the position of the range of the elements. The parameter value is a random double (from 0 to the max cumulative fitness).
- **_void_ mutate**() : Calls the method mutate() for each element.

### dna.pde
Methods
- **_void_ wip**() : WIP :-).
- **_void_ wip**() : WIP :-).

### Mutations type and probabilities
- **One gene** : One gene of the DNA is modified with a random char. **Probability : _40/105_**.
- **Multiple genes** : A random number of genes (from 0 to max) of the DNA is modified with random chars. **Probability : _30/105_**.
- **Split & rearrange** : A random point in the array is choosen, where the DNA gets splitted nad the first part goes last. **Probability : _20/105_**.
- **Reverse genes** : The DNA is reversed. **Probability : _10/105_**.
- **All genes** : All the genes of the DNA are random chars. **Probability : _5/105_**.