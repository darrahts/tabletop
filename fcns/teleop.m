function teleop(agent, fignum, map, poi, state)
%TODO - does not update global state and agent. need to fix
button = 0;
while button ~= 113
    [~,~,button]=ginput(1);
    switch button
        case 30 %up
            agent = moveAgent(agent, '^', 1, map, poi);
            state = update_state(state, agent, map);
            fig = visualizeGridWorld(fignum, map, poi, state, agent);
        case 31 %down
            agent = moveAgent(agent, 'v', 1, map, poi);
            state = update_state(state, agent, map);
            fig = visualizeGridWorld(fignum, map, poi, state, agent);
        case 28 %left
            agent = moveAgent(agent, '<', 1, map, poi);
            state = update_state(state, agent, map);
            fig = visualizeGridWorld(fignum, map, poi, state, agent);
        case 29 %right
            agent = moveAgent(agent, '>', 1, map, poi);
            state = update_state(state, agent, map);
            fig = visualizeGridWorld(fignum, map, poi, state, agent);
        otherwise
            break
    end
end
end

