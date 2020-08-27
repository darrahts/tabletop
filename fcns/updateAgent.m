function agent = updateAgent(agent, newLoc, distance, newDir, map)
%%
%   @brief: updates the agent's state variables (cumulative reward,
%   distance travelled, battery soc, location, direction)
%
%   @inputs:
%       agent: the agent to update
%       newLoc: the agents new location
%       distance: distance travelled
%       newDir: the agents new direction
%       map: the map the agent is on
%
%   @outputs:
%       agent: the updated agent
%%
loc = map(newLoc);
agent.location = newLoc;
agent.direction = newDir;
agent.locationType = loc.type;
agent.distance = agent.distance + 1;
agent.soc = agent.soc - 2*distance;


end

