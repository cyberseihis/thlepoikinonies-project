function [xq, centers, D] =  Lloyd_Max(x, N, min_value, max_value)
    mv=max_value-min_value;
    x=x-min_value;
    M=2^N;
    centers=[0:M-1]/M *mv;
    while 4==4
        T= centers(1:M-1) +centers(2:M);
        T=[T/2 mv];
        for i = 1:M-1
           centers(i) = mean( x(T(i)< x & x < T(i+1)) ); 
        endfor
    endwhile
endfunction