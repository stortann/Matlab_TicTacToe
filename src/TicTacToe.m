clc;
clear all;
close all;

%Setings
roz = 15;
A = zeros(roz);
pl = 1;

%End of game
global closeGame;
closeGame = false;

%Draw game(Empty)
image(DrawGame(A));
 
while ~closeGame
    %Field coordinate
    x = 0;
    y = 0;

    %Select a field
    if pl == 2
        [x, y] = EvaluationFceMV(A, pl); %for maan FceMV pro silu
    else
        [y, x] = PlayerInput( pl, A);
    end
    
    %End of the game?
    if closeGame
        return;
    end
 
    %Input is ok?
    if (x == -1) && (y == -1)
        text(10,10, 'No empty field');
        return;
    else
        if PlayerInputOk( x, y, roz)
            A(y,x) = pl; 
        end
    end
    
    %Draw a game
    image( DrawGame(A));
    
    %Who win
    if WhoWin(A,5)>0
        B = NearbyFields( A, x, y);
        text(10,10, ['player ' int2str(pl) ' is winner']);  
        return;
    end

    %Next player               
    pl = mod(pl, 2) + 1;
end