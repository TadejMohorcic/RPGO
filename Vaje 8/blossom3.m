function b = blossom3(B,U)
% Opis:
%  blossom3 izračuna razcvet polinoma dveh spremenljivk
%
% Definicija:
%  b = blossom3(B,U)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x n+1, ki predstavlja koeficiente
%       polinoma dveh spremenljivk stopnje n v Bezierjevi obliki
%       (element matrike na mestu (i,j), j <= n+2-i, določa
%       koeficient polinoma z indeksom (n+2-i-j, j-1, i-1)),
%  U    matrika velikosti n x 3, v kateri vrstice predstavljavo
%       baricentrične koordinate točk glede na domenski trikotnik,
%       za katere izvajamo razcvet polinoma
%
% Izhodni podatek:
%  b    vrednost razcveta polinoma, določenega z matriko B, v
%       točkah, določenih z matriko U

n = size(B,1) - 1;

for i = 1:n
    for j = 1:n
        for k = 1:n
            B(j,k) = U(i,1)*B(j,k) + U(i,2)*B(j,k+1) + U(i,3)*B(j+1,k);
        end
    end
end

b = B(1,1);

end