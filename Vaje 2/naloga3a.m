B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = linspace(0,1,9);

d1b = bezierder(B,1,t);
d2b = bezierder(B,2,t);
d3b = bezierder(B,3,t);
d4b = bezierder(B,4,t);