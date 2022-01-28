classdef OutputLayer < Layer
    % Output Layer, subclass of Layer 
    % Does not have any unique properties.

    methods
        % Constructor: 
        function obj = OutputLayer(number_of_nodes)
            obj@Layer(number_of_nodes) % Calling superclass constructor to set number of nodes. 
            obj.nodes = OutputNode.empty; % Initialising array, nodes are added in Network file. 
        end
    end
end