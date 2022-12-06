% izbrane barve
c1 = "#E9C46A";
c2 = "#F4A261";
c3 = "#E76F51";

B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = (0.46:0.01:0.54)';
d1b = bezierder(B,1,t);

tab = table();
tab{:,'t'} = t;
tab{:,'x'} = d1b(:,1);
tab{:,'y'} = d1b(:,2);

t = linspace(0,1);
[d1b,d1B] = bezierder(B,1,t);
[d2b,d2B] = bezierder(B,2,t);

subplot(1,3,1);
plotbezier(B,t,c1);

subplot(1,3,2);
plotbezier(d1B,t,c2);

subplot(1,3,3);
plotbezier(d2B,t,c3);
