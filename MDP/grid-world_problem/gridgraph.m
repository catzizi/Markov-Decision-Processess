function [  ] = gridgraph(  )

Value = [5  18  0.05;
10  27  0.06;
20 47   1.98 ];

Policy = [ 5  2   0.01;
10  5   0.10;
20  6   0.85 ];

plot ( Value(:,1)', Value(:,2)', '-b+' , Policy(:,1)', Policy(:,2)', '-g*' );
legend ('value', 'policy', 'Location', 'NorthWest' );
xlabel ('grid size');
ylabel ('iterations');

figure
plot ( Value(:,1)', Value(:,3)', '-b+' , Policy(:,1)', Policy(:,3)', '-g*' );
legend ('value', 'policy', 'Location', 'NorthWest' );
xlabel ('grid size');
ylabel ('time');
