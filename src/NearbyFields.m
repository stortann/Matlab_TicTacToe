function [ matB ] = NearbyFields( A, x, y )
    roz = max(size(A));

    for I = 1:8
        vec = [];
        
        switch (I)
            case 1
                for J = y-1:-1:1
                    vec = [vec A(J,x)];
                end
            case 2
                for J = 1:min( roz - x, y-1)
                    vec = [vec A(y-J,x+J)];
                end
            case 3
                for J = x+1:roz
                    vec = [vec A(y,J)];
                end
            case 4
                for J = 1:min( roz - x, roz - y)
                    vec = [vec A(y+J,x+J)];
                end
                
            case 5
                for J = y+1:roz
                    vec = [vec A(J,x)];
                end
            case 6
                for J = 1:min( x-1, roz - y)
                    vec = [vec A(y+J,x-J)];
                end
            case 7
                for J = x-1:-1:1
                    vec = [vec A(y,J)];
                end
            case 8
                for J = 1:min( x-1, y-1)
                    vec = [vec A(y-J,x-J)];
                end
        end
        
        matB{I} = vec; 
    end
end

