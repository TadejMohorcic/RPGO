% izbrane barve
c1 = '#fae6cd';
c2 = '#f3c0ce';
c3 = '#979bc7';

B = [0 0; 2 3; 5 0; 3 -1; 2 -1];
w = [0.5 0.7 0.8 1 0.6];
rbezier(B,w,linspace(0,1,10))

w1 = w; w1(2) = 2;
rbezier(B,w1,linspace(0,1,10))

w2 = w; w2(2) = 0.2;
rbezier(B,w2,linspace(0,1,10))

t = linspace(0,1);
subplot(1,3,1);
plotrbezier(B,w,t,c1);

subplot(1,3,2);
plotrbezier(B,w1,t,c2);

subplot(1,3,3);
plotrbezier(B,w2,t,c3);