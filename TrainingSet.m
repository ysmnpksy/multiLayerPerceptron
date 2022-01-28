classdef TrainingSet
    % Training set class

    properties
        value % Holds the output value for the current iteration.
        out_values % Holds all thee possible output values. 
        input_nodes % Array tha holds all the input nodes, used so number of input nodes is not hard coded. 
    end

    methods
        % Constructor: 
        function obj = TrainingSet(all_out_values)
            obj.out_values = all_out_values; % Assigns all_out_values.
            obj.input_nodes = InputNode.empty; % Initialises array, nodes get added in network file. 
        end
    end
end