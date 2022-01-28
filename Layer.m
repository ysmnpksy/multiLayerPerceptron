classdef Layer
    % Layer superclass 

    properties
        number_of_nodes
        nodes
    end

    methods
        % Constructor:
        % Nodes array is initalised in subclasses 
        function obj = Layer(number_of_nodes)
            obj.number_of_nodes = number_of_nodes;
        end
    end
end