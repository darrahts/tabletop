function teleop(robot, fignum, map, poi)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
button = 0;
while button ~= 113
    [~,~,button]=ginput(1);
    switch button
        case 30 %up
            robot = moveRobot(robot, '^', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        case 31 %down
            robot = moveRobot(robot, 'v', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        case 28 %left
            robot = moveRobot(robot, '<', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        case 29 %right
            robot = moveRobot(robot, '>', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        otherwise
            break
    end
end
end

