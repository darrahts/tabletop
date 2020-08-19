function robot = moveRobot(robot, direction, distance, map, poi)
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
        new = robot.location(2) + distance;
        % check constraint 1
        if new <= length(map)
            loc = map(robot.location(1), new);
            % check constraint 2
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                % update the robots variables
                robot.location(2) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;
            else
                %fprintf('invalid move.');
            end
        end
    % move down
    case 'v'
        % only updating the y coordinate
        new = robot.location(2) - distance;
        % check constraint 1
        if new > 0
            loc = map(robot.location(1), new);
            % check constraint 2
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                % update the robots variables
                robot.location(2) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;                
            else
                %fprintf('invalid move.');
            end
        end
    % move right
    case '>'
        % only updating the x coordinate
        new = robot.location(1) + distance;
        % check constraint 1
        if new <= length(map(1,:))
            loc = map(new, robot.location(2));
            % check constraint 2
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                % update the robots variables
                robot.location(1) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;        
            else
                %fprintf('invalid move.');
            end
        end
    % move left
    case '<'
        % only updating the x coordinate
        new = robot.location(1) - distance;
        % check constraint 1
        if new > 0
            loc = map(new, robot.location(2));
            % check constraint 2
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                % update the robots variables
                robot.location(1) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;        
            else
                %fprintf('invalid move.');
            end
        end
    otherwise
        msgbox('invalid move.');
end 


end

