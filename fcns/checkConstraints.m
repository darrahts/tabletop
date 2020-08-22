function out = checkConstraints(constraint, agentLocation, map, poi)

out = 0;
switch constraint
    case 'X_LEFT_LIMIT'
        if agentLocation(1) > 0
            out = 1;
        end
    case 'X_RIGHT_LIMIT'
        if agentLocation(1) <= length(map(1,:))
            out = 1;
        end
    case 'Y_UPPER_LIMIT'
        if agentLocation(2) <= length(map)
            out = 1;
        end
    case 'Y_LOWER_LIMIT'
        if agentLocation(2) > 0
            out = 1;
        end
    case 'ON_VALID_LOCATION'
        if strcmp(map(agentLocation(1), agentLocation(2)).type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
            out = 1;
        end
    otherwise
        msgbox('error evaluating constraint number');
end


end

