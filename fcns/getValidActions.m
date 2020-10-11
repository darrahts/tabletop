function validActions = getValidActions(j, i, map, actions)
%%
%   @brief: gets the valid actions for the current state.
%
%   @inputs:
%       j: column index aka the x value in a grid state (x,y) coord
%       i: row index aka the y value in a grid state (x,y) coord
%       map: gridword map
%       actions: list of valid actions
%
%   @outputs:
%       list of valid actions for a given state
%
%   @todo: update function to reflect "state", not just coord location
%%
    validActions = actions;

    % short circuit blocks and exits
    if(map(j,i).type == "block")
        validActions = '';
        return;
    end

    if(map(j,i).label == "O-1" || map(j,i).label == "P-1")
        validActions = '*';
        return;
    elseif(map(j,i).type == "exit")
        validActions = 'o';
    else
        validActions = erase(validActions, '*');
        validActions = erase(validActions, 'o');
    end

  % cannot go left / west in these states
    if(j == 1)
        validActions = erase(validActions, '<');
    end
    % cannot go right / east in these states
    if(j == length(map(:,1)))
        validActions = erase(validActions, '>');
    end
    % cannot go up / north in these states
    if(i == length(map(1,:)))
        validActions = erase(validActions, '^');
    end
    % cannot go down / south in these states
    if(i == 1)
        validActions = erase(validActions, 'v');
    end 
    
    % cant move on block spaces
    if(contains(validActions, '^') && map(j,i+1).type == "block")
        validActions = erase(validActions, '^');
    end
    if(contains(validActions, 'v') && map(j,i-1).type == "block")
        validActions = erase(validActions, 'v');
    end
    if(contains(validActions, '<') && map(j-1,i).type == "block")
        validActions = erase(validActions, '<');
    end
    if(contains(validActions, '>') && map(j+1,i).type == "block")
        validActions = erase(validActions, '>');
    end
end

