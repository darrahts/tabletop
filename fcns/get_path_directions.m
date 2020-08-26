function direction_path = get_path_directions(map, node_path)
%%
%   @brief: converts the numel-index path into a character direction path
%
%   @inputs:
%       map: the map
%       node_path: the numel-index based path
%
%   @outputs:
%       direction_path: a character array of '^', 'v', '<', '>' directions
%%
direction_path = blanks(length(node_path));
[X,Y] = ind2sub(size(map), node_path);
for i = 1:length(node_path)-1
    current = [X(i), Y(i)];
    next = [X(i+1), Y(i+1)];
    if current(1) == next(1) % moving up or down
        if next(2) > current(2) % moving up
            direction_path(i) = '^';
        else
            direction_path(i) = 'v'; % moving down
        end
    elseif current(2) == next(2) % moving right or left
        if next(1) > current(1) % moving right
            direction_path(i) = '>';
        else
            direction_path(i) = '<'; % moving left
        end
    else
        disp('error');
    end
end
end

