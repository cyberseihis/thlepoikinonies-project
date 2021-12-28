function huffSimb ( symb, prob)
    N=length(prob);
    Simb=num2cell([1:N]);
    Dict=cell(1,N);
    for hh = 1:N-1
      
        [b,i]=min(prob);
        prob(i)=NaN;
        [B,I]=min(prob);
        prob(I)=B+b;
        arrayfun(@(x)updateDict(x,0) , Simb{i} );
        arrayfun(@(x)updateDict(x,1) , Simb{I} );
        Simb{I}=[Simb{i} Simb{I}];
        Simb{i}=NaN;


    endfor
    b;

    function updateDict(U,ooz)
        Dict{U}=[ooz Dict{U}];
    endfunction
    
endfunction
