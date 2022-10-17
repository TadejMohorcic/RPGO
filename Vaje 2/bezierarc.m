function B = bezierarc(fi,m)
% funkcija bezierarc izračuna kontrolne točke Bezierjeve krivulje, ki
% predstavlja interpolacijo krožnega loka po izbrani metodi

if m == 1
    B = zeros(3,2);

    B(1,:) = [cos(fi);-sin(fi)];
    B(2,:) = [1/cos(fi);0];
    B(3,:) = [cos(fi);sin(fi)];

elseif m == 2
    B = zeros(4,2);

    B(1,:) = [cos(fi);-sin(fi)];
    B(2,:) = [cos(fi) + (1/3)*sin(fi);-sin(fi) + (1/3)*cos(fi)];
    B(3,:) = [cos(fi) + (1/3)*sin(fi);sin(fi) - (1/3)*cos(fi)];
    B(4,:) = [cos(fi);sin(fi)];

else
    B = zeros(4,2);

    B(1,:) = [cos(fi);-sin(fi)];
    B(2,:) = (1/3)*[4 - cos(fi);4*cot(fi) - 4/sin(fi) + sin(fi)];
    B(3,:) = (1/3)*[4 - cos(fi);-4*cot(fi) + 4/sin(fi) - sin(fi)];
    B(4,:) = [cos(fi);sin(fi)];

end