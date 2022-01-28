classdef HiddenLayer < Layer
    % Hidden Layer class, subclass of Layer 
    % Does not have any unique properties.
    
    methods
        % Constructor: 
        function obj = HiddenLayer(number_of_nodes)
            obj@Layer(number_of_nodes) % Calling superclass constructor to set number of nodes. 
            obj.nodes = HiddenNode.empty; % Initialising array, nodes are added in Network file. 
        end
        
    end
end

