classdef InputNode < Node
    % Input Node Class, subclass of Node

    properties
        outgoing_connections % Array to hold all outgoing connections. 
        all_values % Array to hold all values for each iteration.
    end

    % Constructor:
    methods
        function obj = InputNode(name, all_values)
            obj@Node(name); % Calling superclass constuctor to set name. 
            obj.all_values = all_values; 
            obj.outgoing_connections = Connection.empty; % Initialising array, connections are added in AddConnections file. 
        end
    end
end