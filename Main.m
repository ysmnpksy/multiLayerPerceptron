%% Finishing Setting Up Network.
Network; % Building network by calling network file.
AddConnections; % Adding connections by calling add connections file.

%% Backpropagation Training Algorithm
% Executed once for each training set 
for n=1:length(training_set.input_nodes(1).all_values)
    %% Displaying initial weights 
    disp("ITERATION NUMBER "+n);
    disp("-------------------")
    disp("Start weights:")
    PrintWeights(all_connections);
    disp("  ");
    
    %% Setting input node and out values
    for m=1:length(training_set.input_nodes)
        training_set.input_nodes(m).output_value = training_set.input_nodes(m).all_values(n);
    end 

    training_set.value = training_set.out_values(n);
    learning_rate = 1;
    
    %% Computating output from each node during forward pass: 
    disp("Computed outputs from each node during forward pass:");

    % For hidden nodes first: 
    for i=1:length(all_hidden_layers)
        for j=1:length(all_hidden_layers(i).nodes)
            num = all_hidden_layers(i).nodes(j).bias; % Starting with bias 
            for l=1:length(all_hidden_layers(i).nodes(j).ingoing_connections)
                wgt = all_hidden_layers(i).nodes(j).ingoing_connections(l).weight;
                val = all_hidden_layers(i).nodes(j).ingoing_connections(l).start_node.output_value;
                num = num + (wgt*val);
            end
            all_hidden_layers(i).nodes(j).output_value = num;
            ActivationFunctions(all_hidden_layers(i).nodes(j));
            disp(all_hidden_layers(i).nodes(j).name+": "+all_hidden_layers(i).nodes(j).output_value);
        end
    end
    
    % For output nodes next: 
    for i=1:length(output_layer.nodes)
        num = output_layer.nodes(i).bias;
        for l=1:length(output_layer.nodes(i).ingoing_connections)
            wgt = output_layer.nodes(i).ingoing_connections(l).weight;
            val = output_layer.nodes(i).ingoing_connections(l).start_node.output_value; 
            num = num + (wgt*val);
        end
        output_layer.nodes(i).output_value = num;
        ActivationFunctions(output_layer.nodes(i));  
        disp(output_layer.nodes(i).name+": "+output_layer.nodes(i).output_value);
    end 
    
    %% Computating betas at each node during backward pass: 
    disp("  ");
    disp("Computed betas at each node during backward pass:");

    % For output node first: 
    for i=1:length(output_layer.nodes)
        dev = ActivationDerivatives(output_layer.nodes(i));
        output_layer.nodes(i).beta_value = dev * (training_set.value - output_layer.nodes(i).output_value);
        disp("Beta at node "+output_layer.nodes(i).name+": "+output_layer.nodes(i).beta_value);

    end
    
    % For hidden nodes next: 
    for i=1:length(all_hidden_layers)
        for j=1:length(all_hidden_layers(i).nodes)
            num = ActivationDerivatives(all_hidden_layers(i).nodes(j));
            for p=1:length(all_hidden_layers(i).nodes(j).outgoing_connections)
                sum = all_hidden_layers(i).nodes(j).outgoing_connections(p).weight * all_hidden_layers(i).nodes(j).outgoing_connections(p).end_node.beta_value;
                num = num * sum;
            end
            all_hidden_layers(i).nodes(j).beta_value = num;
            disp("Beta at node "+all_hidden_layers(i).nodes(j).name+": "+all_hidden_layers(i).nodes(j).beta_value);

        end 
    end 

    %% Computating weight changes (deltas) 
    disp("  ");
    disp("Computated weight changes:")
    for i=1:length(all_connections)
        beta = all_connections(i).end_node.beta_value;
        value = all_connections(i).start_node.output_value;
        all_connections(i).change_in_weight = (learning_rate * beta * value);
        disp("Change in "+all_connections(i).name+": "+all_connections(i).change_in_weight);
    end 

    %% Updating the weights
    disp("  ");
    disp("Updated weights, rounded to 4dp:")
    for i=1:length(all_connections)
        all_connections(i).weight = round(all_connections(i).weight + all_connections(i).change_in_weight, 4);
    end 
    PrintWeights(all_connections);
    disp("  ")
end 