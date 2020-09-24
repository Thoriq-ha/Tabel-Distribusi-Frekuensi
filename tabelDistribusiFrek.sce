//Input: Array x[1..n]  , nilai k ditentukan
//Asumsi :  Fungsi Max dan Min sudah ada
//Output: Tabel distribusi Frekuensi (interval, m, r, f, fr,fk)
//ex. n=30

clc
clear
function [interval, m, f, fr,fk] = TDistribusiFrekuensi(x, k, n)
    x_min=min(x);
    x_max=max(x);
    R=x_max-x_min;
    i=ceil(R/k);
    
    for q=1:(k+1)
         interval(q)= x_min + (q-1)*i;
    end
     
    for q=1:k
        m(q)=interval(q)+0.5*i;
        f(q)=0;
    end
     
    for p=1:n
        for q=1:k
            if x(p) >= interval(q)  &  x(p)< interval(q+1)
                 f(q)= f(q)+1;
            end
        end
    end
    
    //Frekuensi Relatif
    for q=1:k
        fr(q)=f(q)/n;
    end
    
    //Frekuensi Kumulatif 
    fk(1)=f(1);
    for q=2:k
        fk(q)=fk(q-1)+f(q);
    end     
endfunction

//MeanData (x[1..n])
//input: Arrayx[1..n]
//Output: mean(rata-rata)
function [mean] = MeanDataK(m, f, fk, k)
    jumlah=0  
    for i=1:k
        jumlah=jumlah + m(i)*f(i);
    end
    mean=jumlah/fk(k)
endfunction

//Input Array m(1..k), f(1..k), fk(k)
//Output variansi
function [variansi]=VariansiDataK(m, f, fk, k)
    mean=MeanDataK(m, f, fk, k)
    jumlah=0
    for p=1:k
        jumlah=jumlah + f(p)*(m(p)^2);//sqr is mean^2
    end
    variansi=(jumlah-fk(k)*mean^2)/(fk(k)-1)
endfunction


