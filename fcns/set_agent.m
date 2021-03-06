function agent = set_agent(agent, map, location, distance, direction, soc, batteryState, cumulativeReward)
%%
%   @brief: sets the agents parameters, useful for iterative debugging
%
%   @inputs:
%       self explanatory
%
%   @outputs:
%       agent
%%

agent.location = location;
agent.locationType = map(location(1), location(2)).type;
agent.direction = direction;
agent.distance = distance;
agent.soc = soc;
agent.cumulativeReward = cumulativeReward;

end

