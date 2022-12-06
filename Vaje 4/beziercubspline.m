function B = beziercubspline(u,D)
% Opis:
%  beziercubspline izračuna sestavljeno Bezierjevo krivuljo stopnje 3,
%  ki je dvakrat zvezno odvedljiva v stikih
%
% Definicija:
%  B = beziercubspline(u,D)
%
% Vhodna podatka:
%  u    seznam parametrov delitve dolžine m+1,
%  D    matrika, v kateri vsaka izmed m+3 vrstic predstavlja eno
%       kontrolno točko sestavljene krivulje
%
% Izhodni podatek:
%  B    celični seznam dolžine m, v kateri je vsak element matrika
%       s štirimi vrsticami, ki določajo kontrolne točke kosa
%       sestavljene krivulje

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