# Monte Carlo simulation of a MPAM modulated signal over AWGN channel 

This is a simple Matlab code that simulates a MPAM transmission throught an Additive White Gaussian Noise channel.
The detector is a Maximum Likelihood detector, which computes the optimal thresholds between signals in the constellation
basing on the a-priori probabilities and the distances. Then, it searches for the correct Voronoi region through a 
binary search.
The simulation breaks if a high number of error is reached, or if 0 errors are detected.
Finally, a plot is provided, comparing the results of the simulation with the theoretical curve.
