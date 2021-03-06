function [P,R] = grid_to_MDP (grid, probab)

% four actions with probability 'probab' successfull
sz = size(grid,1)-2;

P = zeros(sz*sz, sz*sz, 4 );
R = zeros(sz*sz, sz*sz, 4 );

%left =  1
%right = 2
%up =  3;
%down = 4;

% process grid
for i =1:sz
    for j=1:sz
        
        % we are at grid(i+1,j+1)
        if ( grid(i+1,j+1) == -1)
            continue;
        end
            
        [B s] = grid_eval ( grid, i+1, j+1 );
        else_p = 0;
        
        %go left
        if B(1) == 0
            %blocked
            P( i*sz+j, i*sz+j, 1 ) = probab;
            R( i*sz+j, i*sz+j, 1 ) = grid(i+1,j)*probab;
            else_p = (1-probab)/(s-1);
        else
            P( i*sz+j, i*sz+j-1, 1 ) = probab;
            R( i*sz+j, i*sz+j-1, 1 ) = grid(i+1,j)*probab;
            else_p = (1-probab)/s;
        end
        
        if ( j < sz )
            P (i*sz+j, i*sz+j+1, 1 ) = B(2)*else_p;
            R( i*sz+j, i*sz+j+1, 1 ) = grid(i+1,j+2)*else_p*B(2);
        end
        if ( i > 1 )
            P (i*sz+j, (i-1)*sz+j, 1) = B(3)*else_p;
            R( i*sz+j, (i-1)*sz+j, 1 ) = grid(i,j+1)*else_p*B(3);
        end
        if ( i < sz )
            P (i*sz+j, (i+1)*sz+j, 1 ) = B(4)*else_p;
            R( i*sz+j, (i+1)*sz+j, 1 ) = grid(i+2,j+1)*else_p*B(4);
        end
            
        %go right
        if B(2) == 0
            %blocked
            P( i*sz+j, i*sz+j, 2 ) = probab;
            R( i*sz+j, i*sz+j, 2 ) = grid(i+1,j+2)*probab;
            else_p = (1-probab)/(s-1);
        else
            P( i*sz+j, i*sz+j+1, 2 ) = probab;
            R( i*sz+j, i*sz+j+1, 2 ) = grid(i+1,j+2)*probab;
            else_p = (1-probab)/s;
        end
        
        if ( j > 1 )
            P (i*sz+j, i*sz+j-1, 2 ) = B(1)*else_p;
            R( i*sz+j, i*sz+j-1, 2 ) = grid(i+1,j)*else_p*B(1);
        end
        if ( i > 1 )
            P (i*sz+j, (i-1)*sz+j, 2) = B(3)*else_p;
            R( i*sz+j, (i-1)*sz+j, 2 ) = grid(i,j+1)*else_p*B(3);
        end
        if ( i < sz )
            P (i*sz+j, (i+1)*sz+j, 2 ) = B(4)*else_p;
            R( i*sz+j, (i+1)*sz+j, 2 ) = grid(i+2,j+1)*else_p*B(4);
        end
        
        %go up
        if B(3) == 0
            %blocked
            P( i*sz+j, i*sz+j, 3 ) = probab;
            R( i*sz+j, i*sz+j, 3 ) = grid(i,j+1)*probab;
            else_p = (1-probab)/(s-1);
        else
            P( i*sz+j, (i-1)*sz+j, 3 ) = probab;
            R( i*sz+j, (i-1)*sz+j, 3 ) = grid(i,j+1)*probab;
            else_p = (1-probab)/s;
        end
        
        if ( j > 1 )
            P (i*sz+j, i*sz+j-1, 3 ) = B(1)*else_p;
            R( i*sz+j, i*sz+j-1, 3 ) = grid(i+1,j)*else_p*B(1);
        end

        if ( j < sz )
            P (i*sz+j, i*sz+j+1, 1 ) = B(2)*else_p;
            R( i*sz+j, i*sz+j+1, 1 ) = grid(i+1,j+2)*else_p*B(2);
        end

        if ( i < sz )
            P (i*sz+j, (i+1)*sz+j, 3 ) = B(4)*else_p;
            R( i*sz+j, (i+1)*sz+j, 3 ) = grid(i+2,j+1)*else_p*B(4);
        end
        
        
        %go down
        if B(4) == 0
            %blocked
            P( i*sz+j, i*sz+j, 4 ) = probab;
            R( i*sz+j, i*sz+j, 4 ) = grid(i+2,j+1)*probab;
            else_p = (1-probab)/(s-1);
        else
            P( i*sz+j, (i+1)*sz+j, 4 ) = probab;
            R( i*sz+j, (i+1)*sz+j, 4 ) = grid(i+2,j+1)*probab;
            else_p = (1-probab)/s;
        end
        
        if ( j > 1 )
            P (i*sz+j, i*sz+j-1, 4 ) = B(1)*else_p;
            R( i*sz+j, i*sz+j-1, 4 ) = grid(i+1,j)*else_p*B(1);
        end

        if ( j < sz )
            P (i*sz+j, i*sz+j+1, 4 ) = B(2)*else_p;
            R( i*sz+j, i*sz+j+1, 4 ) = grid(i+1,j+2)*else_p*B(2);
        end

        if ( i > 1 )
            P (i*sz+j, (i-1)*sz+j, 4) = B(3)*else_p;
            R( i*sz+j, (i-1)*sz+j, 4 ) = grid(i,j+1)*else_p*B(3);
        end
        
    end
end
