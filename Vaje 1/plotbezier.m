function p = plotbezier(B,t,c)
% Opis:
%  plotbezier nariše Bezierjevo krivuljo za dane kontrolne točke in
%  seznam parametrov
%
% Definicija:
%  p = plotbezier(B,t,c)
%
% Vhodni podatki:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne točke
%       Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
%  t    seznam parametrov dolžine k, pri katerih računamo vrednost
%       Bezierjeve krivulje,
%  c    parameter, ki določa barvo krivulje
%
% Izhodni podatek:
%  p    grafični objekt, ki določa krivuljo

hold on
axis equal

b = bezier(B,t);

p = {
    plot(b(:,1),b(:,2),'Color',c,...
                       'LineWidth',1.5);

    plot(B(:,1),B(:,2),'Color','#1E1C32');

    scatter(B(:,1),B(:,2),25,'MarkerEdgeColor','#1E1C32',...
                             'MarkerFaceColor','#C6BAAC');
    };

end