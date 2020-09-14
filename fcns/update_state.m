function state = update_state(state, agent, map)
%%
%   @brief: updates the MDP state
%
%   @inputs:
%       state: current state
%       agent: the agent to update
%       map: the map the agent is on
%
%   @outputs:
%       state: the updated state
%%
state.location = agent.location;

if agent.soc >= 84
    state.battery = 1;
elseif agent.soc >= 36
    state.battery = 2;
elseif agent.soc >= 18
    state.battery = 3;
else
    state.battery = 4;
end

if strcmp(map(state.location(1), state.location(2)).label, 'O-1')
    state.achieved1 = true;
    state.reward = state.reward + 5;
end

if strcmp(map(state.location(1), state.location(2)).label, 'O-2')
    state.achieved2 = true;
    state.reward = state.reward + 10;
end


if state.achieved1 == true 
    if isequal(state.location, [1,1])
        state.reward = state.reward + 20;
    end
end
    
end

