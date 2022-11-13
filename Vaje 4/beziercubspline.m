function B = beziercubspline(u, D)
% funkcija beziercubspline izračuna sestavljeno Bezierjevo krivuljo stopnje
% 3, ki je dvakrat zvezno odvedljiva v stikih.

n = size(D,1);
m = size(D,2);
v = diff(u);
o = length(v);
B = cell(1,o);

for i = 1:o
    B{1,i} = zeros(4,m);
end

for i = 1:m
    B{1}(1,i) = D(1,i);
    B{1}(2,i) = D(2,i);
    B{1}(3,i) = (v(2)/(v(1)+v(2)))*D(2,i) + (v(1)/(v(1)+v(2)))*D(3,i);
end

for i = 2:o-1
    for j = 1:m
        B{i}(2,j) = ((v(i)+v(i+1))/(v(i-1)+v(i)+v(i+1)))*D(i+1,j) + (v(i-1)/(v(i-1)+v(i)+v(i+1)))*D(i+2,j);
        B{i}(3,j) = (v(i+1)/(v(i-1)+v(i)+v(i+1)))*D(i+1,j) + ((v(i-1)+v(i))/(v(i-1)+v(i)+v(i+1)))*D(i+2,j);
    end
end

for i = 1:m
    B{o}(2,i) = (v(o)/(v(o-1)+v(o)))*D(n-2,i) + (v(o-1)/(v(o-1)+v(o)))*D(n-1,i);
    B{o}(3,i) = D(n-1,i);
    B{o}(4,i) = D(n,i);
end

for i = 1:o-1
    for j = 1:m
        B{i}(4,j) = (v(i+1)/(v(i)+v(i+1)))*B{i}(3,j) + (v(i)/(v(i)+v(i+1)))*B{i+1}(2,j);
        B{i+1}(1,j) = (v(i+1)/(v(i)+v(i+1)))*B{i}(3,j) + (v(i)/(v(i)+v(i+1)))*B{i+1}(2,j);
    end
end

end