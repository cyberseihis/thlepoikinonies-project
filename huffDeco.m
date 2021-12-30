function deco= huffDeco(hcode,dict)
    ff=dict2tree(dict);
    disp(ff{3});
    f=ff;
    for o = hcode
      f=f(o+2);
      if(length([f])==1)
        disp(f);
        f=ff;
      endif
    endfor
endfunction
function dott= dict2tree(dick)
    dott={};
    for i = 1:length(dick)
        mae=num2cell(dick{i}+2);
        dott(mae{:})=i;
        dott;
    endfor
    dott;
endfunction

function beginswith0 (ar)
    disp(ar);
    % return(true);
endfunction