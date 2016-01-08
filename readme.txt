Chenzi Wang
cwang493
Assignment 4: Markov Decision Processes

Instuctions:
The code uses Matlab with MDPtoolbox Version 1.6 downloaded from:
http://www7.inra.fr/mia/T/MDPtoolbox/MDPtoolbox.html
http://www.mathworks.com/matlabcentral/fileexchange/25786-markov-decision-processes--mdp--toolbox

Grid-world problems:
found in MDP\grid-world_problem folder)
Value algorithm: solve_grid_value.m
Policy algorithm: solve_grid_policy.m
Gauss-Seidel: solve_grid_valueGS.m
Solves a grid-world markov decision process
In the code, specifiy the grid world to be evaluated
For example:
	for the easier grid: my_grid = grid_easy;
	for the harder grid: my_grid = grid_hard;
	for the 20X20 version of the easier grid: my_grid = grid_easy_10;
solve_grid*.m produces graphical representations of the optimal policies, V values, and parameters showing the performance of the algorithms
gridgraph.m produces graphical representations of the change in computation time and iterations with larger grids (increased number of states)

Racetrack problems:
Open MDP\racetrackproblem folder
For the 10X10 racetrack problem, use the following:
Value algorithm: main_value.m
Policy algorithm: main_policy.m
Gauss-Seidel: main_valueGS.m
Graph parameters showing performance for different values of p: racegraph.m

For the 25X25 racetrack problem, use the following:
Value algorithm: main_value25X25.m
Policy algorithm: main_policy25X25.m
Gauss-Seidel: main_valueGS25X25.m
Graph parameters showing performance for different values of p: racegraph25X25.m

The code for the value and policy algorithms output graphical representations of optimal policies and output performance parameters.
To change the probability an optimal action will be chosen, change the value of p in the algorithm codes
p = 1 - probability an optimal action will be chosen
For instance:
	90% probability an optimal action will be chosen
	p = 1 - 0.9
		p = 0.1;
	100% probability an optimal action will be chosen
	p = 1 - 1.0
		p = 0.0;

