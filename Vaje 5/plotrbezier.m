function p = plotrbezier(B,w,t,c)
% Opis:
%  plotrbezier nariše racionalno Bezierjevo krivuljo za dane kontrolne
%  točke, uteži in seznam parametrov
%
% Definicija:
%  p = plotrbezier(B,w,t,c)
%
% Vhod:
%  B    matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
%       eno kontrolno točko racionalne Bezierjeve krivulje stopnje n
%       v prostoru dimenzije d,
%  w    seznam uteži racionalne Bezierjeve krivulje,
%  t    seznam parametrov dolžine N, za katere se računajo točke na
%       racionalni Bezierjevi krivulji
%  c    parameter, ki določa barvo krivulje
%
% Izhodni podatek:
%  p    grafični objekt, ki določa krivuljo

hold on
axis equal

b = rbezier(B,w,t);

n = size(B,1);
m = size(B,2);

q = zeros(n-1,m);

for i = 1:n-1
    q(i,:) = (w(i)/(w(i) + w(i+1)))*B(i,:) + (w(i+1)/(w(i) + w(i+1)))*B(i+1,:);
end

p = {
    plot(b(:,1),b(:,2),'Color',c,'LineWidth',1.5);
    plot(B(:,1),B(:,2),'Color','#272946');
    scatter(B(:,1),B(:,2),25,'MarkerEdgeColor','#272946','MarkerFaceColor','#eda031');
    scatter(q(:,1),q(:,2),25,'MarkerEdgeColor','#272946','MarkerFaceColor','#e7ffee');
    };

end