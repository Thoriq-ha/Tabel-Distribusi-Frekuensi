//MeanData (x[1..n])
//input: Arrayx[1..n]
//Output: mean(rata-rata)

function [mean] = MeanData(x, k)
    jumlah=0  
    for i=1:k
        jumlah=jumlah + m(i)*f(i);
    end
    mean=jumlah/fk(k)
endfunction
