classdef HiddenNode < Node 
    % Hidden Node class, subclass of Node 

    properties
        activation_function
        bias
        outgoing_connections
        ingoing_connections
        beta_value
    end

    methods
        % Constructor:
        function obj = HiddenNode(name, activation_function, bias)
            obj@Node(name); % Calling superclass contructor to set name. 
            obj.activation_function = activation_function;
            obj.bias = bias;
            obj.beta_value = 0;
            obj.outgoing_connections = Connection.empty; % Initialising array, connections are added in AddConnections file. 
            obj.ingoing_connections = Connection.empty; % Initialising array, connections are added in AddConnections file. 
        end
    end
end