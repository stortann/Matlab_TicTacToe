function [ x, y ] = PlayerInput( pl, A)
    x = -1;
    y = -1;
    roz = max(size(A));
    global closeGame;
    
    closeGame = false;
    
    %Zadani tahu
    Ok = false;
    while not(Ok)
        Ok = true;
        ['Hraje hrac ' int2str(pl)]
        try
            [y, x] = ginput(1);
        catch
            closeGame = true;
            return
        end

        x = floor(x/64) + 1;
        y = floor(y/64) + 1;

        if not((x>0) && (x<=roz)) || not((y>0) && (y<=roz))
           Ok = false; 
        else
            if A(x,y) ~= 0
               Ok = false;  
            end
        end

        if not(Ok)
            disp 'Chybne zadani';
        end      
    end
end

