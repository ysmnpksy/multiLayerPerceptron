classdef Node < handle
    % Node superclass
    % Subclass of handle to pass by reference 

    properties
        name
        output_value
    end

    methods
        % Constructor:
        % Value will be set at different types depending on type of node 
        function obj = Node(name) % Sets name only. 
            obj.name = name;
        end
    end
end