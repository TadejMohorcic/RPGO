function u = alphaparam(P,a)
% Opis:
%  alphaparam sestavi alfa parametrizacijo oziroma delitev domene na
%  podlagi točk
%
% Definicija:
%  u = alphaparam(P,a)
%
% Vhodna podatka:
%  P    matrika z m+1 vrsticami, v kateri vsaka vrstica predstavlja
%       eno točko,
%  a    parameter, ki določa alfa parametrizacijo
%
% Izhodni podatek:
%  u    seznam parametrov delitve, ki so določeni rekurzivno tako, da
%       se trenutnemu parametru iz seznama u prišteje z a potencirana
%       norma razlike zaporednih točk iz seznama P

n = size(P,1);
u = zeros(1,n);

for i = 2:n
    u(1,i) = u(1,i-1) + (norm([P(i,1)-P(i-1,1);P(i,2)-P(i-1,2)]))^a;
end

end