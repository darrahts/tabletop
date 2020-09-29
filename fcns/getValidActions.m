function validActions = getValidActions(j, i, map, actions)
    validActions = actions;
  % cannot go left / west in these states
    if(j == 1)
        validActions = erase(validActions, '<');
        % text(j-.9, i-.6, sprintf("<"));
        % plot(j-.9, i-.6, '<', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 5);
    end
    % cannot go right / east in these states
    if(j == length(map(:,1)))
        validActions = erase(validActions, '>');
        % plot(j-.1, i-.6, '>', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 5);
    end
    % cannot go up / north in these states
    if(i == length(map(1,:)))
        validActions = erase(validActions, '^');
        % plot(j-.45, i-.1, '^', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 5);
    end
    % cannot go down / south in these states
    if(i == 1)
        validActions = erase(validActions, 'v');
        % plot(j-.45, i-.9, 'v', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerSize', 5);
    end
    
    if(map(j,i).type == "block")
        validActions = '';
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

