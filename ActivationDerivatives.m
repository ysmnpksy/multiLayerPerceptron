%% Function to implement the activation function derivatives.
% Returns the derivative of the output_value.
% Works with 5 different activation functions, shown below.

function dev = ActivationDerivatives(node)
    dev = 0;
    x = node.output_value;
    activation = node.activation_function; 

    switch(activation)
        case "sigmoid"
            dev = x * (1-x);
        case "relu"
            if x>0
                dev = 1;
            end 
        case "linear" 
            dev = 1; 
        case "summation"
            dev = 1;
        case "tanh"
            dev = 1-x^2;
    end
end