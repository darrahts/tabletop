function f = visualize(fig, title, map, poi, robot)
%%
%   draws the map, robot, and points of interest
%
%%
f = figure(fig); clf;

width = length(map(1,:));
height = length(map);
rectangle('Position', [0 0 width height]);
hold on;
grid on;

start = poi.start;
objectives = poi.objectives;
pitfalls = poi.pitfalls;
blocks = poi.blocks;

rectangle('Position', [start(1,1)-1, start(1,2)-1, 1, 1], 'FaceColor', 	'#4DBEEE');
s = line(start(1,1)-1, start(1,2)-1, 'LineWidth', 4, 'Color', '#4DBEEE');
text(start(1)-.6, start(2)-.5, "S");

for i=1:length(objectives(:,:))
   rectangle('Position', [objectives(i,1)-1, objectives(i,2)-1, 1, 1], 'FaceColor', 	'#77AC30');
   text(objectives(i,1)-.6, objectives(i,2)-.5, "O");
   o = line(objectives(i,1)-1, objectives(i,2)-1, 'LineWidth', 4, 'Color', '#77AC30');
end
for i=1:length(pitfalls(:,:))
   rectangle('Position', [pitfalls(i,1)-1, pitfalls(i,2)-1, 1, 1], 'FaceColor', 	'#A2142F');
   text(pitfalls(i,1)-.6, pitfalls(i,2)-.5, "P");
   p = line(pitfalls(i,1)-1, pitfalls(i,2)-1, 'LineWidth', 4, 'Color', '#A2142F');
end

for i=1:length(blocks(:,:))
   rectangle('Position', [blocks(i,1)-1, blocks(i,2)-1, 1, 1], 'FaceColor', 	'#000000');
   b = line(blocks(i,1)-1, blocks(i,2)-1, 'LineWidth', 4, 'Color', '#000000');
end

r = plot(robot.location(1) -.7, robot.location(2)-.7, robot.direction, 'MarkerFaceColor', '#D95319', 'MarkerEdgeColor', '#D95319');
hold off;

legend([s o p b r], 'start', 'objective', 'pitfalls', 'block', 'robot');

end