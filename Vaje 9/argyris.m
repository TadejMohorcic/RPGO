function B = argyris(T,f,Df,Hf)
% Opis:
%  argyris izračuna Bezierjeve ordinate polinoma dveh spremenljivk
%  stopnje 5, ki interpolira vrednosti, prve in druge odvode podane
%  funkcije f v ogliščih trikotnika ter odvode funkcije f v središčih
%  stranic trikotnika v smereh, pravokotnih na posamezno stranico
%
% Definicija:
%  B = argyris(T,f,Df,Hf)
%
% Vhodni podatki:
%  T        tabela velikosti 3 x 2, v kateri vsaka vrstica predstavlja
%           oglišče trikonika, nad katerim je definiran polinom,
%  f        funkcija, ki jo interpoliramo,
%  Df       gradient funkcije, ki jo interpoliramo,
%  Hf       Hessejeva matrika funkcije, ki jo interpoliramo
%
% Izhodni podatek:
%  B        matrika velikosti 6 x 6, ki predstavlja koeficiente polinoma
%           dveh spremenljivk stopnje 5 v Bezierjevi obliki (element
%           matrike na mestu (i,j), j <= 7-i, določa koeficient polinoma
%           z indeksom (7-i-j, j-1, i-1)), ki interpolira funkcijo f

B = nan(6);

V1 = T(1,:);
V2 = T(2,:);
V3 = T(3,:);

B(1,1) = f(V1(1),V1(2));
B(1,6) = f(V2(1),V2(2));
B(6,1) = f(V3(1),V3(2));

B(1,2) = B(1,1) + 1/5*dot(Df(V1(1),V1(2)),T(2,:)-T(1,:));
B(2,1) = B(1,1) + 1/5*dot(Df(V1(1),V1(2)),T(3,:)-T(1,:));
B(1,5) = B(1,6) + 1/5*dot(Df(V2(1),V2(2)),T(1,:)-T(2,:));
B(2,5) = B(1,6) + 1/5*dot(Df(V2(1),V2(2)),T(3,:)-T(2,:));
B(5,1) = B(6,1) + 1/5*dot(Df(V3(1),V3(2)),T(1,:)-T(3,:));
B(5,2) = B(6,1) + 1/5*dot(Df(V3(1),V3(2)),T(2,:)-T(3,:));

B(1,3) = B(1,1) + 2/5*dot(Df(V1(1),V1(2)),T(2,:)-T(1,:)) + 1/20*dot(T(2,:)-T(1,:),Hf(V1(1),V1(2))*(T(2,:)-T(1,:))');
B(2,2) = B(1,1) + 1/5*dot(Df(V1(1),V1(2)),T(2,:)-T(1,:)) + 1/5*dot(Df(V1(1),V1(2)),T(3,:)-T(1,:)) + 1/20*dot(T(3,:)-T(1,:),Hf(V1(1),V1(2))*(T(2,:)-T(1,:))');
B(3,1) = B(1,1) + 2/5*dot(Df(V1(1),V1(2)),T(3,:)-T(1,:)) + 1/20*dot(T(3,:)-T(1,:),Hf(V1(1),V1(2))*(T(3,:)-T(1,:))');
B(1,4) = B(1,6) + 2/5*dot(Df(V2(1),V2(2)),T(1,:)-T(2,:)) + 1/20*dot(T(1,:)-T(2,:),Hf(V2(1),V2(2))*(T(1,:)-T(2,:))');
B(2,4) = B(1,6) + 1/5*dot(Df(V2(1),V2(2)),T(1,:)-T(2,:)) + 1/5*dot(Df(V2(1),V2(2)),T(3,:)-T(2,:)) + 1/20*dot(T(3,:)-T(2,:),Hf(V2(1),V2(2))*(T(1,:)-T(2,:))');
B(3,4) = B(1,6) + 2/5*dot(Df(V2(1),V2(2)),T(3,:)-T(2,:)) + 1/20*dot(T(3,:)-T(2,:),Hf(V2(1),V2(2))*(T(3,:)-T(2,:))');
B(4,1) = B(6,1) + 2/5*dot(Df(V3(1),V3(2)),T(1,:)-T(3,:)) + 1/20*dot(T(1,:)-T(3,:),Hf(V3(1),V3(2))*(T(1,:)-T(3,:))');
B(4,2) = B(6,1) + 1/5*dot(Df(V3(1),V3(2)),T(1,:)-T(3,:)) + 1/5*dot(Df(V3(1),V3(2)),T(2,:)-T(3,:)) + 1/20*dot(T(2,:)-T(3,:),Hf(V3(1),V3(2))*(T(1,:)-T(3,:))');
B(4,3) = B(6,1) + 2/5*dot(Df(V3(1),V3(2)),T(2,:)-T(3,:)) + 1/20*dot(T(2,:)-T(3,:),Hf(V3(1),V3(2))*(T(2,:)-T(3,:))');

V12 = 1/2*(V1+V2);
V13 = 1/2*(V1+V3);
V23 = 1/2*(V2+V3);

v12 = [V2(2) - V1(2) V1(1) - V2(1)]/norm([V2(2) - V1(2) V1(1) - V2(1)]);
v13 = [V3(2) - V1(2) V1(1) - V3(1)]/norm([V3(2) - V1(2) V1(1) - V3(1)]);
v23 = [V3(2) - V2(2) V2(1) - V3(1)]/norm([V3(2) - V2(2) V2(1) - V3(1)]);

u12 = vectorbary(v12,T);
u13 = vectorbary(v13,T);
u23 = vectorbary(v23,T);

B(2,3) = 8/15*1/u12(3)*dot(Df(V12(1),V12(2)),v12) - 1/6*(B(2,1) + 4*B(2,2) + 4*B(2,4) + B(2,5)) - 1/6*u12(1)/u12(3)*(B(1,1) + 4*B(1,2) + 6*B(1,3) + 4*B(1,4) + B(1,5)) - 1/6*u12(2)/u12(3)*(B(1,6) + 4*B(1,5) + 6*B(1,4) + 4*B(1,3) + B(1,2));
B(3,2) = 8/15*1/u13(2)*dot(Df(V13(1),V13(2)),v13) - 1/6*(B(1,2) + 4*B(2,2) + 4*B(4,2) + B(5,2)) - 1/6*u13(1)/u13(2)*(B(1,1) + 4*B(2,1) + 6*B(3,1) + 4*B(4,1) + B(5,1)) - 1/6*u13(3)/u13(2)*(B(6,1) + 4*B(5,1) + 6*B(4,1) + 4*B(3,1) + B(2,1));
B(3,3) = 8/15*1/u23(1)*dot(Df(V23(1),V23(2)),v23) - 1/6*(B(1,5) + 4*B(2,4) + 4*B(4,2) + B(5,1)) - 1/6*u23(2)/u23(1)*(B(1,6) + 4*B(2,5) + 6*B(3,4) + 4*B(4,3) + B(5,2)) - 1/6*u23(3)/u23(1)*(B(6,1) + 4*B(5,2) + 6*B(4,3) + 4*B(3,4) + B(2,5));

end