%% This file takes in the network. 
% All layers, their nodes and it's connections are added here. 
% This is the only file that should be chnaged. 
% Details on where to add different components can be found in each section. 

%% SETTING UP - DO NOT CHANGE.
% This section initialises the arrays used further down. 
all_hidden_layers = HiddenLayer.empty;
all_connections = Connection.empty;

%% HIDDEN LAYERS - Make hidden layers and add nodes.
% Making each hidden layer here. 
% Layer class takes as argument the number of nodes. 
all_hidden_layers(end+1) = HiddenLayer(3);

% Adding all nodes to each of the hidden layers.
% Hidden Node class takes as argument name, activation function and bias. 
% The first number, the 1 in all_hidden_nodes(1), represnts which number layer each node will be added to. 
all_hidden_layers(1).nodes(end+1) = HiddenNode("sigmoid1", "sigmoid", 0);
all_hidden_layers(1).nodes(end+1) = HiddenNode("sigmoid2", "sigmoid", 0);
all_hidden_layers(1).nodes(end+1) = HiddenNode("sigmoid3", "sigmoid", 0);

%% OUTPUT LAYER - Make output layer and add nodes.
% Making the output layer. 
% Layer class takes as argument the number of nodes. 
output_layer = OutputLayer(1);

% Adding all nodes to output layer.
% Output Node class takes as argument name, activation function and bias. 
output_layer.nodes(end+1) = OutputNode("sum", "summation", 0);

%% TRAINING SET - Make training set and add all possible values. 
% Training Set class takes as argument the all ouput values of the set.
training_set = TrainingSet([1, 1]);

% Adding nodes to training set.
% Input node takes as argument name of the node and array of all possible values.
training_set.input_nodes(end+1) = InputNode("x1", [1,0]); 
training_set.input_nodes(end+1) = InputNode("x2", [0,1]); 

%% Adding connections 
% Connections get added to all_connections array.
% Connection class takes as input name, weight, name of start node, name of end node. 
all_connections(end+1) = Connection("w1", 0.2, "x1", "sigmoid1");
all_connections(end+1) = Connection("w2", 0.15, "x1", "sum");
all_connections(end+1) = Connection("w3", 0.3, "x1", "sigmoid2");
all_connections(end+1) = Connection("w4", -0.15, "x2", "sigmoid2");
all_connections(end+1) = Connection("w5", -0.1, "x2", "sum");
all_connections(end+1) = Connection("w6", 0.25, "x2", "sigmoid3");
all_connections(end+1) = Connection("w7", -0.15, "sigmoid3", "sum");
all_connections(end+1) = Connection("w8", 0.2, "sigmoid2", "sum");
all_connections(end+1) = Connection("w9", -0.1, "sigmoid1", "sum");