function [ x, y ] = EvaluationFceMV( A, pl )
B = -ones(size(A));

%Projit vsechna policka a ohodnotit je
for J=1:size(A, 1)
    for I=1:size(A,2)
        if A(J, I) == 0
            B(J, I) = 0;
            %Ohodnoceni policka na J radku a I sloupci
            NF = NearbyFields( A, I, J);
            
            for K=1:4
                PP = 0; %pocet prazdnych\player1\player2
                P1 = 0;
                P2 = 0;
                NFS1 = NF{K};
                NFS2 = NF{K+4};
                
                for L=1:size(NFS1, 2)
                    if (NFS1(L) == 0) || (NFS1(L) == 2)
                        PP = PP + 1;
                    else
                        break;
                    end
                end
                
                for L=1:size(NFS1, 2)
                    if NFS1(L) == 1
                        P1 = P1 + 1;
                    else
                        break;
                    end
                end
                
                for L=1:size(NFS1, 2)
                    if NFS1(L) == 2
                        P2 = P2 + 1;
                    else
                        break;
                    end
                end
                
                
                %Smer 2
                for L=1:size(NFS2, 2)
                    if (NFS2(L) == 0) || (NFS2(L) == 2)
                        PP = PP + 1;
                    else
                        break;
                    end
                end
                
                for L=1:size(NFS2, 2)
                    if NFS2(L) == 1
                        P1 = P1 + 1;
                    else
                        break;
                    end
                end
                
                for L=1:size(NFS2, 2)
                    if NFS2(L) == 2
                        P2 = P2 + 1;
                    else
                        break;
                    end
                end
                
                
                
                %Vypocet hodnoty
                agr=1;
                def=1.1;
                
                if PP>=4
                    B(J, I) = B(J, I) + 5;
                    
                    
                end
                
                if (pl == 1)
                    B(J, I) = B(J, I) + def*P1*P1;
                else
                    B(J, I) = B(J, I) + def*P2*P2;
                end
                
                %B(J, I) = B(J, I) + P1*P1;
                if (pl == 1)
                    B(J, I) = B(J, I) + agr*P1*P1;
                else
                    B(J, I) = B(J, I) + agr*P2*P2;
                end
            end
        end
    end
end

%Vyber policka
M = -1;
x = -1;
y = -1;

for J=1:size(A, 1)
    for I=1:size(A,2)
        if B(J,I)>M
            x = I;
            y = J;
            M = B(J,I);
        end
    end
end



