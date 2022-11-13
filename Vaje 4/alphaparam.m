function u = alphaparam(P,a)
% funkcija alphaparam sestavi alfa parametrizacijo oziroma delitev domene
% na podlagi točk.

n = size(P,1);
u = zeros(1,n);

for i = 2:n
    u(1,i) = u(1,i-1) + (norm([P(i,1)-P(i-1,1);P(i,2)-P(i-1,2)]))^a;
end

end