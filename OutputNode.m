classdef OutputNode < Node
    % Output Node Class, subclass of Node

    properties
        activation_function 
        bias
        ingoing_connections
        beta_value
    end

    methods
        % Constructor: 
        function obj = OutputNode(name, activation_function, bias)
            obj@Node(name); % Calling constructor from superclass to set name. 
            obj.activation_function = activation_function; 
            obj.bias = bias;
            obj.ingoing_connections = Connection.empty; % Initialising array, connections are added in AddConnections file. 
        end
    end
end