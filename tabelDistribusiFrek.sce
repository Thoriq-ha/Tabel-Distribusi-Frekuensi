//TDistribusiFrekuensi(x[1..n], k)
//Input: Array x[1..n], nilai k ditentukan
//Asumsi : Fungsi Max dan Min sudah ada
//Output : Tabel distribusi Frekuensi(interval, m, f, fr, fk)
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

//MeanData(x[1..n])
//Input Array x[1..n]
//Output: mean (rata-rata)
function [mean] = MeanData(x, n)
    jumlah = 0
    for i=1:n
        jumlah=jumlah + x(i);
    end
    mean = jumlah/n
endfunction

//MeanDataK (m[1..n], f[1..k], fk[k])
//input: Arrayx m[1..k], f[1..k], fk[k]
//Output: mean(rata-rata)
function [mean] = MeanDataK(m, f, fk, k)
    jumlah=0  
    for i=1:k
        jumlah=jumlah + m(i)*f(i);
    end
    mean=jumlah/fk(k)
endfunction

//VariansiData(x[1..n])
//input: Array x(1..n)
//Output: variansi
function [variansi] = VariansiData(x, n)
    jumlah=0
    for i=1:n
        jumlah=jumlah+x(i)^2
    end
    variansi=(jumlah-n*(mean^2))/(n-1)
endfunction

//VariansiDataK(m[1..k], f[1..k], f[k])
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
