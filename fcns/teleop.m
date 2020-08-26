function teleop(robot, fignum, map, poi)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
button = 0;
while button ~= 113
    [~,~,button]=ginput(1);
    switch button
        case 30 %up
            robot = moveAgent(robot, '^', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        case 31 %down
            robot = moveAgent(robot, 'v', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        case 28 %left
            robot = moveAgent(robot, '<', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        case 29 %right
            robot = moveAgent(robot, '>', 1, map, poi);
            fig = visualizeGridWorld(fignum, map, poi, robot);
        otherwise
            break
    end
end
end

