function [  ] = gridgraph(  )

Value = [0.6  33.7  61    7.956;
0.9  23.7  36    7.873;
1.0 20   25    7.936 ];

Policy = [ 0.6  32.3   10    7.904;
0.9  22.7   13    7.834;
1.0  20   14    7.899 ];

plot ( Value(:,1)', Value(:,2)', '-b+' , Policy(:,1)', Policy(:,2)', '-g*' );
legend ('value', 'policy', 'Location', 'NorthWest' );
xlabel ('p');
ylabel ('Track Time');

figure
plot ( Value(:,1)', Value(:,3)', '-b+' , Policy(:,1)', Policy(:,3)', '-g*' );
legend ('value', 'policy', 'Location', 'NorthWest' );
xlabel ('p');
ylabel ('Iterations');

figure
plot ( Value(:,1)', Value(:,4)', '-b+' , Policy(:,1)', Policy(:,4)', '-g*' );
legend ('value', 'policy', 'Location', 'NorthWest' );
xlabel ('p');
ylabel ('Comp. Time');