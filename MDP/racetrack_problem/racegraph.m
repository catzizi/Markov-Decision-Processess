function [  ] = gridgraph(  )

Value = [0.6  18.3  99    1.414;
0.9  15  27    1.435;
1.0 11   15    1.403 ];

Policy = [ 0.6  21   8    1.389;
0.9  14.5   8    1.407;
1.0  11   10    1.378 ];

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