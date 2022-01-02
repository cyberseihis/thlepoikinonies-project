function enco= huffEnco(sig, dict)
    enco=[];
    for i = 1:length(sig)
      enco=[enco dict{sig(i)}];
    endfor
endfunction