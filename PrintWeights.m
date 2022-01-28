%% Function to print all names and weights of connections. 

function PrintWeights(all_connections)
    for i=1:length(all_connections)
        con = all_connections(i);
        disp(con.name + ": " + con.weight);
    end
end