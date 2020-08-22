function agent = moveRobot(agent, direction, distance, map, poi)
%%
%   @brief: moves the robot and updates the robot's location, direction, locationType,
%       and cumulative reward.
%
%   @inputs:
%       robot: the robot to move
%       direction: the direction to move in set D = {'^', 'v', '<', '>'}
%       distance: the positive integer value distance to move
%       map: the map to move
%       poi: the "points of interest" for the map as a struct with tuple
%           locations in the form [x1, y1; x2, y2; ...]
%
%   @outputs:
%       robot: robot with updated values
%
%   @constraints:
%       1) robot cannot move off the map
%       2) robot cannot move onto a block
%%
switch direction
    % move up
    case '^'
        % only updating the y coordinate
        new = agent.location(2) + distance;
        % ensure robot is on grid
        if checkConstraints('Y_UPPER_LIMIT', [agent.location(1), new], map, poi)
            % ensure robot is on valid location
            if checkConstraints('ON_VALID_LOCATION', [agent.location(1), new], map, poi)
                % update the robots variables
                loc = map(agent.location(1), new);
                agent.location(2) = new;
                agent.direction = direction;
                agent.locationType = loc.type;
                agent.cumulativeReward = agent.cumulativeReward + loc.reward;
            else
                %fprintf('invalid move.');
            end
        end
    % move down
    case 'v'
        % only updating the y coordinate
        new = agent.location(2) - distance;
        % ensure robot is on grid
        if checkConstraints('Y_LOWER_LIMIT', [agent.location(1), new], map, poi)
            % ensure robot is on valid location
            if checkConstraints('ON_VALID_LOCATION', [agent.location(1), new], map, poi)
                % update the robots variables
                loc = map(agent.location(1), new);
                agent.location(2) = new;
                agent.direction = direction;
                agent.locationType = loc.type;
                agent.cumulativeReward = agent.cumulativeReward + loc.reward;                
            else
                %fprintf('invalid move.');
            end
        end
    % move right
    case '>'
        % only updating the x coordinate
        new = agent.location(1) + distance;
        % ensure robot is on grid
        if checkConstraints('X_RIGHT_LIMIT', [new, agent.location(2)], map, poi)
            loc = map(new, agent.location(2));
            % ensure robot is on valid location
            if checkConstraints('ON_VALID_LOCATION', [new, agent.location(2)], map, poi)
                % update the robots variables
                agent.location(1) = new;
                agent.direction = direction;
                agent.locationType = loc.type;
                agent.cumulativeReward = agent.cumulativeReward + loc.reward;        
            else
                %fprintf('invalid move.');
            end
        end
    % move left
    case '<'
        % only updating the x coordinate
        new = agent.location(1) - distance;
        % ensure robot is on grid
        if checkConstraints('X_LEFT_LIMIT', [new, agent.location(2)], map, poi)
            loc = map(new, agent.location(2));
            % ensure robot is on valid location
            if checkConstraints('ON_VALID_LOCATION', [new, agent.location(2)], map, poi)
                % update the robots variables
                agent.location(1) = new;
                agent.direction = direction;
                agent.locationType = loc.type;
                agent.cumulativeReward = agent.cumulativeReward + loc.reward;        
            else
                %fprintf('invalid move.');
            end
        end
    otherwise
        msgbox('invalid move.');
end 


end

