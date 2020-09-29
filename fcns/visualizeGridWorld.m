function f = visualizeGridWorld(fig, map, poi, state, agent, policy)
%%
%   draws the map, robot, and points of interest
%
%%

if ~exist('policy', 'var')
    policy = repmat(1,1,numel(map));
end

f = figure(fig); clf;
height = length(map(1,:));
width = length(map);
f.Position = [0 0 800 400];
rectangle('Position', [0 0 width height]);
hold on;
set(gca, 'YTick', 0:length(map(1,:)));
set(gca, 'XTick', 0:length(map(:,1)));

start = poi.start;
objectives = poi.objectives;
pitfalls = poi.pitfalls;
blocks = poi.blocks;

rectangle('Position', [start(1,1)-1, start(1,2)-1, 1, 1], 'FaceColor', 	'#4DBEEE');
s = line(start(1,1)-1, start(1,2)-1, 'LineWidth', 4, 'Color', '#4DBEEE');
text(start(1)-.2, start(2)-.1, "S", 'FontSize', 16);

for i=1:length(objectives(:,1))
   rectangle('Position', [objectives(i,1)-1, objectives(i,2)-1, 1, 1], 'FaceColor', 	'#77AC30');
   text(objectives(i,1)-.3, objectives(i,2)-.1, sprintf("O-%d", i), 'FontSize', 16);
   o = line(objectives(i,1)-1, objectives(i,2)-1, 'LineWidth', 4, 'Color', '#77AC30');
end
for i=1:length(pitfalls(:,1))
   rectangle('Position', [pitfalls(i,1)-1, pitfalls(i,2)-1, 1, 1], 'FaceColor', 	'#A2142F');
   text(pitfalls(i,1)-.3, pitfalls(i,2)-.1, sprintf("P-%d", i), 'FontSize', 16);
   p = line(pitfalls(i,1)-1, pitfalls(i,2)-1, 'LineWidth', 4, 'Color', '#A2142F');
end

for i=1:length(blocks(:,1))
   rectangle('Position', [blocks(i,1)-1, blocks(i,2)-1, 1, 1], 'FaceColor', 	'#000000');
   b = line(blocks(i,1)-1, blocks(i,2)-1, 'LineWidth', 4, 'Color', '#000000');
end

num = 1;
for i=1:length(map(1,:))
    for j = 1:length(map(:,1))
        text(j-.9, i-.1, sprintf("R: %.2f", map(num).reward));
        text(j-.9, i-.3, sprintf("V: %.2f", map(num).value));
        text(j-.9, i-.9, sprintf("s(%d)", num));
        
        if(policy(num) == 1)
            % up
            annotation('arrow', [(j/length(map(:,1))/1.5 +.05) (j/length(map(:,1))/1.5 + .05)], [((i-1)/3.5 + .15) ((i-1)/3.5 + .25)]);
        elseif(policy(num) == 2)
            % down
            annotation('arrow', [(j/length(map(:,1))/1.5 +.05) (j/length(map(:,1))/1.5 + .05)], [((i-1)/3.5 + .25) ((i-1)/3.5 + .15)]);
        elseif(policy(num) == 3)
            % left
            annotation('arrow', [(j/length(map(:,1))/1.5 +.035) (j/length(map(:,1))/1.5 + .08)], [((i-1)/3.5 + .2) ((i-1)/3.5 + .2)]);
        else
            % right
            annotation('arrow', [(j/length(map(:,1))/1.5 +.035) (j/length(map(:,1))/1.5 + .08)], [((i-1)/3.5 + .2) ((i-1)/3.5 + .2)]);
        end
        
        num = num + 1;
    end
end

r = plot(agent.location(1) -.7, agent.location(2)-.7, agent.direction, 'MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319');
hold off;

legend([s o p b r], map(poi.start(1,1), poi.start(1,2)).type, map(poi.objectives(1,1), poi.objectives(1,2)).type, map(poi.pitfalls(1,1), poi.pitfalls(1,2)).type, map(poi.blocks(1,1), poi.blocks(1,2)).type, agent.type, 'Location', 'northeastoutside');
t = sprintf('location: %s\nbattery: %i\nobjectives: [%i]', mat2str(state.location), state.battery, state.achieved1);%, state.achieved2);
annotation('textbox', [.79 .535 .14 .16], 'String', t);


end