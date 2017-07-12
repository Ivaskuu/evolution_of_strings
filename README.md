# Evolution of strings
This is a java (processing) project that simulates the genetic evolution of a string of text.

_It's my first Machine Learning - Artificial Intelligence project, so please be gentle with me :-)_

### Files
The project is composed of 3 files :
- **main.pde** : It creates a population based on the target, the mutation rate and the number of elements, and train it.
- **population.pde** : It manages all the elements, that form the population, cioè a method to train the elements, and method to reproduce them.
- **dna.pde** : It contains the genes of an element, a method to calculate it's fitness, a method to mutate and a method to create an element from 2 parents.