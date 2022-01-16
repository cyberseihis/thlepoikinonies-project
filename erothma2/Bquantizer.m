function [xq, centers, D] =  Bquantizer(x, N, min_value, max_value)
    mv=max_value-min_value;
    x=x-min_value;
    M=2^N;
    centers=[0:M-1]/M *mv;
    DD= mean( min((x-centers').^ 2 ));
    deltaD=DD;
    while abs(deltaD)> 0.00001
        T= centers(1:M-1) +centers(2:M);
        T=[0 T/2 mv];
        for i = 1:M
            rm= x(T(i)< x & x < T(i+1)) ;
            if numel(rm)==0
                rm=centers(i);
                %what even
            endif
           centers(i) = mean(rm); 
        endfor
        DD=[DD mean( min((x-centers').^ 2 ))];
        deltaD= DD(length(DD)) - DD(length(DD)-1);
    endwhile
    [trot,JJ] = min(abs(x-centers'));
    centers=centers+min_value;
    xq=centers(JJ);
    D=DD;
endfunction