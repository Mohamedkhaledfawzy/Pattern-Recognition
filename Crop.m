function [ y ] = Crop(x)
[r,c,v]= find (x>0);
%r-> this means the indexes of row that nonzero value %
%c -> this means the indexes of coulmn that non zero value %
minrow = min (r);
maxrow= max (r);
mincolumn = min (c);
maxcolumn = max (c);

y = x(minrow:maxrow , mincolumn : maxcolumn);


end
