function robot = moveRobot(robot, direction, distance, map)
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
            robot.location(2) = new;
            robot.direction = direction;
        end
    case 'v'
        new = robot.location(2) - distance;
        if new > 0
            robot.location(2) = new;
            robot.direction = direction;
        end
    case '>'
        new = robot.location(1) + distance;
        if new <= length(map(1,:))
            robot.location(1) = new;
            robot.direction = direction;
        end
    case '<'
        new = robot.location(1) - distance;
        if new > 0
            robot.location(1) = new;
            robot.direction = direction;
        end
    otherwise
        disp('invalid move.');
end 

if map(robot.location).type == 
     

end

