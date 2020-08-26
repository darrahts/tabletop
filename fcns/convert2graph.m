function G = convert2graph(map, block, pitfall)
%%
%   @brief: creates an undirected graph from a map
%
%   @inputs:
%       map: the map
%       block: the name given to locations that cannot be reached
%       pitfall: the name given to locations with higher cost / negative value 
%
%   @outputs:
%       G: an undirected graph
%%
[a,b] = ndgrid(1:length(map),1:length(map(1,:)));
ab = [a(:), b(:)];
dist = pdist2(ab, ab);
adj_mat = (dist >= .001 & dist <= 1.001).*dist;
G_temp = graph(adj_mat);
E = table2array(G_temp.Edges);
V = cellstr(num2str(ab));

b = find(strcmp([map.type], block));
b1 = ismember(E(:,1), b);
bi1 = find(b1);
b2 = ismember(E(:,2), b);
bi2 = find(b2);

p = find(strcmp([map.type], pitfall));
p1 = ismember(E(:,1), p);
pi1 = find(p1);
p2 = ismember(E(:,2), p);
pi2 = find(p2);

E([pi1; pi2], 3) = 5; %pitfalls have a cost
E([bi1; bi2], :) = []; % cant move on a block

EndNodes = E(:, (1:2));
Weight = E(:, 3);
Edges = array2table([EndNodes, Weight], "VariableNames", {'EndNodes1', 'EndNodes2', 'Weight'});
Edges = mergevars(Edges, [1 2], "NewVariableName", 'EndNodes');
%Nodes = cell2table(V, "VariableNames", {'Name'});
%G = graph(Edges, Nodes);
G = graph(Edges);
end

