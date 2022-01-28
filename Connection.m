classdef Connection < handle 
    % Connection Class 

    properties
        name
        weight
        start_node 
        end_node 
        start_node_name
        end_node_name
        change_in_weight
    end

    methods
        % Constructor:
        function obj = Connection(name, wgt, start_n, end_n)
            obj.name = name;
            obj.weight = wgt;
            obj.start_node_name = start_n;
            obj.end_node_name = end_n; 
        end
        % Set start_node and end_node later in AddConnections file.
    end
end