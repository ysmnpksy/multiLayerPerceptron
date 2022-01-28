%% Adding all connections to relevent ingoing and outgoing lists: 
for i=1:length(all_connections)
    end_node = all_connections(i).end_node_name;
    start_node = all_connections(i).start_node_name;

    % Searching for start node in input nodes: 
    for j=1:length(training_set.input_nodes)
        if strcmp(start_node, (training_set.input_nodes(j).name))
            all_connections(i).start_node = training_set.input_nodes(j);
            training_set.input_nodes(j).outgoing_connections(end+1) = all_connections(i);
        end
    end

    % Searching for start and end node in hidden nodes: 
    for j=1:length(all_hidden_layers)
        for m=1:length(all_hidden_layers(j).nodes)
            if strcmp(start_node, all_hidden_layers(j).nodes(m).name)
                all_connections(i).start_node = all_hidden_layers(j).nodes(m);
                all_hidden_layers(j).nodes(m).outgoing_connections(end+1) = all_connections(i);
            end 
            if strcmp(end_node, all_hidden_layers(j).nodes(m).name)
                all_connections(i).end_node = all_hidden_layers(j).nodes(m);
                all_hidden_layers(j).nodes(m).ingoing_connections(end+1) = all_connections(i);
            end 
        end 
    end 

    % Searching for end node in output layer:
    for j=1:length(output_layer.nodes)
        if strcmp(end_node, output_layer.nodes(j).name)
            all_connections(i).end_node = output_layer.nodes(j);
            output_layer.nodes(j).ingoing_connections(end+1) = all_connections(i);
        end
    end 
end