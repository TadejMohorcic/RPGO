function plotbezier2(Bx,By,Bz,u,v)
% Opis:
%  plotbezier nariše Bezierjevo ploskev iz tenzorskega produkta
%
% Definicija:
%  p = plotbezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki predstavljajo
%               koordinate kontrolnih točk,
%  u, v         vrstici, ki predstavljata parametre v smereh u in v
%
% Izhodni podatek:
%  p            grafični objekt, ki določa ploskev

[bx,by,bz] = bezier2(Bx,By,Bz,u,v);

colormap spring
mesh(Bx,By,Bz,'FaceColor','None','EdgeColor','#272946');
hold on
scatter3(Bx,By,Bz,'MarkerEdgeColor','#272946','MarkerFaceColor','#eda031');
hold on
surf(bx,by,bz,'EdgeColor','#272946');

end