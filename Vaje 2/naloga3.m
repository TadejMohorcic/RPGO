% kontrolne točke
B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = linspace(0,1,9);

d1b = bezierder(B,1,t)
d2b = bezierder(B,2,t)
d3b = bezierder(B,3,t)
d4b = bezierder(B,4,t)

[d1b,d1B] = bezierder(B,1,t)
[d2b,d2B] = bezierder(B,2,t)
[d3b,d3B] = bezierder(B,3,t)
[d4b,d4B] = bezierder(B,4,t)

% nova Bezierjeva krivulja
t = (0.46:0.01:0.54)';
d1b = bezierder(B,1,t);
tab = table();
tab{:,'t'} = t;
tab{:,'x'} = d1b(:,1);
tab{:,'y'} = d1b(:,2);

t = linspace(0,1);
[d1b,d1B] = bezierder(B,1,t);
[d2b,d2B] = bezierder(B,2,t);

% samo enega pusti odkomentiranega
plotbezier(B,t);
%plotbezier(d1B,t);
%plotbezier(d2B,t);