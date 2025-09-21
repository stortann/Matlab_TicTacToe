function [ x, y ] = EvaluationFce( A, pl )
%Random field
found = false;
x = 1;
y = 1;

while ~found
    found = false;

    x = round(rand(1,1)*(size(A,1)-1)) + 1;
    y = round(rand(1,1)*(size(A,2)-1)) + 1;

    if A(y,x) == 0
        found = true;
    end
    
    %Exists empty field?
    if sum(sum(A == 0)) == 0
        x = -1;
        y = -1;
        found = true;
    end
end
    
