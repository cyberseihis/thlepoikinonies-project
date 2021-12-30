function deco= huffDeco(hcode,dict)
    [M,ff,lenz]=dict2tree(dict);
    deco=[];
    f=[];
    for i = hcode
        f=[f i];
        fn=sig2ind(f,M);
        if(ff(fn)!=0 && lenz(ff(fn))==length(f))
            deco=[deco ff(fn)];
            f=[];
        endif   
    endfor
endfunction
function [M,dott,lenz]= dict2tree(dick)
    M=0;
    lenz=zeros(length(dick));
    for i= 1:length(dick)
        M=max(M,length(dick{i}));
        lenz(i)=length(dick{i});
    endfor
    %normalize
    en=zeros(1,2^M);
    for i= 1:length(dick)
        while length(dick{i})<M
          dick{i}=[dick{i} 0];
        endwhile
        dick{i}=bin2dec(sprintf('%i',dick{i}));
        en(dick{i}+1)=i;
    endfor
    dott=en;
endfunction

function en = sig2ind (ar,M)
    while length(ar)<M
        ar=[ar 0];
    endwhile
    en=bin2dec(sprintf('%i',ar))+1;
endfunction