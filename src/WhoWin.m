function [ win ] = WhoWin( A, winC)
    win = 0;
    roz = max(size(A));
    
    if (nargin < 2)  ||  isempty(winC)
        winC = 5;
    end
        
    %1
    for I= 1:roz
        pl = 0;
        c = 0;
    
        for J = 1:roz
            if A(I, J) > 0
                if A(I, J) == pl
                    c = c +1;
                else
                    pl = A(I, J);
                    c = 1;
                end
                  
                if c>= winC
                    win = pl;
                    return;
                end
            else
                c = 0;
                pl = 0;
            end
        end
    end

    %2 
    for J = 1:roz
        pl = 0;
        c = 0;
    
        for I= 1:roz
            if A(I, J) > 0
                if A(I, J) == pl
                   c = c +1;
                else 
                   pl = A(I, J);
                   c = 1;
                end
            
                if c>= winC
                    win = pl;
                    return;
                end
            else
                c = 0;
                pl = 0;
            end
        end
    end

    %3a
    for J = 1:roz
        pl = 0;
        c = 0;
    
        for I= 1:J
            x = I;
            y = roz - (J-I);
            
            if A(y, x) > 0
                if A(y, x) == pl
                    c = c +1;
                else
                    pl = A(y, x);
                    c = 1;
                end
            
                if c>= winC
                    win = pl;
                    return;
                end
            else
                c = 0;
                pl = 0;
            end
        end
    end
    
    %3b
    for J = 2:roz
        pl = 0;
        c = 0;
    
        for I= 1:roz-J+1
            x = J + I - 1;
            y = I;
            
            if A(y, x) > 0
                if A(y, x) == pl
                    c = c +1;
                else
                    pl = A(y, x);
                    c = 1;
                end
            
                if c>= winC
                    win = pl;
                    return;
                end
            else
                c = 0;
                pl = 0;
            end
        end
    end
    
    %4a   
    for J = 1:roz
        pl = 0;
        c = 0;
    
        for I= 1:J
            x = I;
            y = J-I+1;
            
            if A(y, x) > 0
                if A(y, x) == pl
                    c = c +1;
                else
                    pl = A(y, x);
                    c = 1;
                end
            
                if c>= winC
                    win = pl;
                    return;
                end
            else
                c = 0;
                pl = 0;    
            end
        end
    end
    
    %4b   
    for J = 2:roz
        pl = 0;
        c = 0;
    
        for I= 1:roz-J+1
            x = J + I - 1;
            y = roz - I + 1;
            
            if A(y, x) > 0
                if A(y, x) == pl
                    c = c +1;
                else
                    pl = A(y, x);
                    c = 1;
                end
            
                if c>= winC
                    win = pl;
                    return;
                end
            else
                c = 0;
                pl = 0;    
            end
        end
    end
end

