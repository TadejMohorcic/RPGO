B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = linspace(0,1,9);

[d1b,d1B] = bezierder(B,1,t);
[d2b,d2B] = bezierder(B,2,t);
[d3b,d3B] = bezierder(B,3,t);
[d4b,d4B] = bezierder(B,4,t);