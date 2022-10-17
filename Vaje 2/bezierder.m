function [db,dB] = bezierder(B,r,t)
% funkcija bezierder vrne točke na krivulji, ki predstavljajo odvod dane
% Bezierjeve krivulje

m = length(t);
n = size(B,2);
o = size(B,1);
db = zeros(m,n);
dB = zeros(o-r,n);

for i = 1:m
    for j = 1:n
        M = decasteljau(B(:,j),t(i));
        for k = 1:r+1
            db(i,j) = db(i,j) + (-1)^(r-k+1)*nchoosek(r,k-1)*M(k,o-r);
        end
    end
end
db = factorial(o-1)/factorial(o-1-r) * db;

for i = 1:n
    N = diff(B(:,i),r);
    for j = 1:o-r
        dB(j,i) = factorial(o-1)/factorial(o-1-r)*N(j);
    end
end

end