function enco= huffEnco(sig, dict)
    dict2tree(dict);
endfunction

function dict2tree(dick)
    dott=cell(1,2);
    dott{1}=find([dick](:)(1)==0);
    dott;
endfunction