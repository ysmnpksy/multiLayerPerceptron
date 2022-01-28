%% Function to implement the activation function.
% Sets the output_value in the function, doesn't return anything.
% Works with 5 different activation functions, shown below.

function ActivationFunctions(node)
    x = node.output_value;
    activation = node.activation_function; 

    switch(activation)
        case "sigmoid"
            e = exp(1);
            node.output_value = (1/(1+e.^(-1*x)));
        case "relu"
            if x<0
                node.output_value = 0; 
            end 
        case "linear"
            node.output_value = x;
        case "summation"
            node.output_value = x;
        case "tanh"
            node.output_value = (exp(x) - exp(-x)) / (exp(x) + exp(-x));
    end
end