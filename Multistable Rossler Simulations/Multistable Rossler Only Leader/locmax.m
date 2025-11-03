function y = locmax(x)

x = 200*x./(max(x)-min(x));% Normalize the input data.
dy = x(2:max(size(x)))-x(1:max(size(x))-1);% Calculate the first difference (approximate derivative) of the scaled data.
z = find(dy>0)+1;% Find the indices where the signal is increasing (slope is positive).
dz = z(2:max(size(z)))-z(1:max(size(z))-1);%Calculate the difference *between* the indices stored in 'z'.
zz = find(dz>1);% Find where the gaps in the rising sequence occur.
y = z(zz);% Get the indices of the local maxima.
