function [ x, y ] = EvaluationFceJM( A, pl )
B = zeros(size(A));

CoefCreateLine = 0.4;
CeofAttack = 3;
CoefDefense = 4;

%Create value for fields
for J=1:size(A,1)
    for I=1:size(A,2)
        if A(J,I) == 0
            NF = NearbyFields( A, I, J);
            
            for K=1:4
                %Is create line possible?
                P1 = 0;
                NF1 = NF{K};
                
                for L=1:size( NF1, 2)
                    if (NF1(L) == 0) || (NF1(L) == pl)
                        P1 = P1 + 1 ;
                    else
                        break;
                    end
                end
                
                P2 = 0;
                NF2 = NF{K+4};
                
                for L=1:size( NF2, 2)
                    if (NF2(L) == 0) || (NF2(L) == pl)
                        P2 = P2 + 1 + 0.1*L;
                    else
                        break;
                    end
                end
                
                B(J,I) = B(J,I) + CoefCreateLine*(P1+P2);
                
                %Try complete our lines
                P1 = 0;
                NF1 = NF{K};
                
                for L=1:size( NF1, 2)
                    if NF1(L) == pl
                        P1 = P1 + 1 + 0.15*L;
                    else
                        break;
                    end
                end
                
                P2 = 0;
                NF2 = NF{K+4};
                
                for L=1:size( NF2, 2)
                    if (NF2(L) == pl)
                        P2 = P2 + 1 + 0.2*L;
                    else
                        break;
                    end
                end
                
                B(J,I) = B(J,I) + CeofAttack*(P1+P2)*(P1+P2);
                
                %Defense opponent lines
                plo = mod(pl, 2) + 1;
                
                P1 = 0;
                NF1 = NF{K};
                
                for L=1:size( NF1, 2)
                    if NF1(L) == plo
                        P1 = P1 + 1 + 0.3*L;
                    else
                        break;
                    end
                end
                
                P2 = 0;
                NF2 = NF{K+4};
                
                for L=1:size( NF2, 2)
                    if NF2(L) == plo
                        P2 = P2 + 1 + 0.1*L;
                    else
                        break;
                    end
                end
                
                B(J,I) = B(J,I) + CoefDefense*(P1+P2)*(P1+P2);
            end
        else
            B(J,I) = -1;
        end
    end
end

%Choose field with the biggest value
M = -1;

for J=1:size(A,1)
    for I=1:size(A,2)
        if B(J,I) > M
            x = I;
            y = J;
            M = B(J,I);
        end
    end
end
