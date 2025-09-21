function [ x, y ] = EvaluationFceBI( A, pl )
R = 16*(size(A)); 
Guess = zeros(size(A));

random = true;
istheresomething = false; %is there something on a desk

M = -1;
x = -1;
y = -1;

%am i first?
for J=1:size(A, 1)
    for I=1:size(A,2)
        if A(J, I) == 2 || A(J, I) == 1
            istheresomething = true;
            break;
        end
    end
end

%first player
if istheresomething == false 
    if random == true
        r = randi(5,1)+5; 
        x = r; 
        r = randi(5,1)+5; 
        y = r;
    else
        x = 7;
        y = 7;
    end
%not first move
else
    istheresomething = false;
    %no possibility
    if istheresomething == false
        Guess = fornow(A,pl);
        for J=1:size(A, 1)
            for I=1:size(A,2)
                if Guess(J,I)>M
                    x = I;
                    y = J;
                    M = Guess(J,I);
                end
            end
        end
    %yes possible
    else        
        for J=1:size(A, 1)
            for I=1:size(A,2)
                if R(J,I)>M
                    x = I;
                    y = J;
                    M = R(J,I);
                end
            end
        end                        
    end        
end