% izbrane barve
c1 = "#E9C46A";
c2 = "#F4A261";
c3 = "#E76F51";

B = [0 0; 1 2; 3 3; 4 -1; 0 2];
t = linspace(0,1);
subplot(1,3,1);
plotbezier(B,t,c1);

% zrcaljenje krivulje čez y os
Bz = B*[-1 0; 0 1];
subplot(1,3,2);
plotbezier(Bz,t,c2);

% rotacija krivulje za 60 stopinj
fi = pi/3;
Br = B*[cos(fi) -sin(fi); sin(fi) cos(fi)]';
subplot(1,3,3);
plotbezier(Br,t,c3);
