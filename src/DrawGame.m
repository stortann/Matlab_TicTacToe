function [Obr] = DrawGame( A )
    figure(1);
    Ko = imread('Circle.png');
    Kr = imread('Cross.png');
    Pr = imread('Empty.png');

    roz = max(size(A));
    
    Obr = ones(roz*64, roz*64, 3);
    
    for I= 1:roz
        for J = 1:roz
            switch A(I, J)
                case 0
                   Obr((1:64) + (I-1)*64, (1:64) + (J-1)*64, :) = Pr(:,:,:);
                case 1
                   Obr((1:64) + (I-1)*64, (1:64) + (J-1)*64, :) = Ko(:,:,:);
                case 2
                   Obr((1:64) + (I-1)*64, (1:64) + (J-1)*64, :) = Kr(:,:,:);
            end
        end
    end

    Obr= Obr/255;
end

