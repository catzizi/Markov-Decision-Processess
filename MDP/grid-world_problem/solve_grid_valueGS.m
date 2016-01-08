function [ ] = solve_grid( )

my_grid = grid_hard;
figure;
colormap(gray); imagesc(my_grid);
set(gca,'XTick',[0.5:1:31.5],...
        'YTick',[0.5:1:31.5])
grid on;
title ('Grid 20')

%prepare
sz = size(my_grid,1)-2;
[P,R] = grid_to_MDP (my_grid,0.9);


%solve
[policy, iter, cpu_time] = mdp_value_iterationGS ( P, R, 0.9 );


display ( [ num2str(iter) '  &  ' num2str(cpu_time) ] );

%plot policy
figure;
colormap(gray); imagesc(my_grid);
hold on

dir_x = zeros(sz,sz);
dir_y = zeros(sz,sz);
len = 0.5;

for i=1:sz
    for j=1:sz
        
        dir = policy( (i-1)*sz+j );
        
        if ( my_grid(i+1,j+1) == -1 || my_grid(i+1,j+1) == 1 )
            continue;
        end
        
        if ( dir == 1 )
            dir_x(i,j) = -len;
        elseif (dir ==2 )
            dir_x(i,j) = len;
        elseif ( dir == 3)
            dir_y(i,j) = -len;
        else
            dir_y (i,j) = len;
        end
    end
end

[ x y ] = meshgrid (2:sz+1,2:sz+1);
quiver (x,y,dir_x,dir_y );

set(gca,'XTick',[0.5:1:31.5],...
        'YTick',[0.5:1:31.5])
grid on;
title ('Grid 20 - solution');
hold off;

%plot V-values
V = policy/sz;
figure;colormap(gray); imagesc(my_grid);
set(gca,'XTick',[0.5:1:15.5],...
        'YTick',[0.5:1:15.5])
grid on;
title ('Intermediate grid - V values')

for i=1:sz
    for j=1:sz
        text( j+1-0.2, i+1, num2str(V( (i-1)*sz+j ), '%10.2f' ), 'BackgroundColor',[1 1 1] );
    end
end

figure;
colormap(gray);
imagesc( reshape(V,sz,sz)' );
title ('V values');

