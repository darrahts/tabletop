function robot = moveRobot(robot, direction, distance, map, poi)
%%
%   updates the robots location 
%
%%

oldLoc = robot.location;
oldDir = robot.direction;

switch direction
    case '^'
        new = robot.location(2) + distance;
        if new <= length(map)
            loc = map(robot.location(1), new);
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                robot.location(2) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;
            else
                %fprintf('invalid move.');
            end
        end
    case 'v'
        new = robot.location(2) - distance;
        if new > 0
            loc = map(robot.location(1), new);
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                robot.location(2) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;                
            else
                %fprintf('invalid move.');
            end
        end
    case '>'
        new = robot.location(1) + distance;
        if new <= length(map(1,:))
            loc = map(new, robot.location(2));
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
                robot.location(1) = new;
                robot.direction = direction;
                robot.locationType = loc.type;
                robot.cumulativeReward = robot.cumulativeReward + loc.reward;        
            else
                %fprintf('invalid move.');
            end
        end
    case '<'
        new = robot.location(1) - distance;
        if new > 0
            loc = map(new, robot.location(2));
            if strcmp(loc.type, map(poi.blocks(1,1), poi.blocks(1,2)).type) == 0
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

