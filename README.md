# Multi-Layer Perceptron

## Project description
This project consists of a MATLAB implementation of the incremental backpropagation algorithm for a multi-layer perceptron. This implementation supports any number of hidden layers with biases, any number of nodes in each layer and multiple different activation functions.

## How to install the project
Download a zip file of the project from the code menu above. The downloaded folder needs to be unzipped and all files need to be uploaded to MATLAB.

## How to use the project
You can run this project in MATLAB. To insert a new multi-layer perceptron, you need to edit the Network.m file. Comments and examples in this file explain how to add layers, noded and connections. This is the **only** file that should be edited. 

Once the correct network is implemented, open the Main.m file and run it. This will produce the output for the correct number of iterations based on how many training sets you added to thr Network.m file. This is the **only** file that should be run.


The output produced will show:
+ The output of each node.
+ The beta value of each node.
+ The delta value of each weight.
+ The updated weights.

## File breakdown
Multiple files consist of data structures. Most of these have subclasses, as shown below:
+ Layer.m
	+ HiddenLayer.m
	+ OutputLayer.m
+ Node.m
	+ InputNode.m
	+ HiddenNode.m
	+ OutputNode.m
+ Connections.m
+ TrainingSet.m

Some files are consist of functions:
+ AddConnections.m
+ PrintWeights.m
+ ActivationDerivatives.m
+ ActivationFunctions.m

The network itself is detailed on the Network.m file. All of these files are brought together by the Main.m file.
