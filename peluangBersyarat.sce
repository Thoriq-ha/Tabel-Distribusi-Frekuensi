//Algoritma P_AgB(A,B)
//Input: Himpunan kejadian A,B
//A,B kejadian tidak bebas (dependent event)
//Output P_AgB peluang A dengan syarat B

function [P_AgB]= PeluangBersyarat (A,B,S)
    P_B=length(A)/length(S)
    if P_B ~= 0
        P_AB=length(intersect(A,B)) /length (S);
        P_AgB=P_AB/P_B;
    end
endfunction
