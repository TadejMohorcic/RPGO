function [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
% Opis:
%  bezier2 vrne točke na Bezierjevi ploskvi iz tenzorskega produkta
%
% Definicija:
%  [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki predstavljajo
%               koordinate kontrolnih točk,
%  u, v         vrstici dolžine M in N, ki predstavljata parametre
%               v smereh u in v
%
% Izhodni podatki:
%  bx, by, bz   matrike velikosti N x M, ki predstavljajo točke na
%               Bezierjevi ploskvi: [bx(J,I) by(J,I) bz(J,I)] je
%               točka pri parametrih u(I) in v(J)

M = length(u);
N = length(v);
n = size(Bx,2);

bx = zeros(N,M);
by = zeros(N,M);
bz = zeros(N,M);

b = zeros(n,3);

for i = 1:N
    for j = 1:n
        b(j,:) = bezier([Bx(:,j) By(:,j) Bz(:,j)],v(i));
    end
    for k = 1:M
        bx(i,k) = bezier(b(:,1),u(k));
        by(i,k) = bezier(b(:,2),u(k));
        bz(i,k) = bezier(b(:,3),u(k));
    end
end

end