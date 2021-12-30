jj=huffDict([88 99 0 78],[0.5 .3 .1 .1]);
ee=huffEnco([1 2 3 4 1 4 1 4],jj);
ff=huffDeco(ee,jj);