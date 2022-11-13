D = [-5 0; -4 1; -2 -1; 0 3; 3 0; 5 2; 7 -1];
P = D([1 3 4 5 7],:);

ue = alphaparam(P,0);
Be = beziercubspline(ue,D);
[Be{1} Be{2}; Be{3} Be{4}]

uc = alphaparam(P,0.5);
Bc = beziercubspline(uc,D);
[Bc{1} Bc{2}; Bc{3} Bc{4}]

ut = alphaparam(P,1);
Bt = beziercubspline(ut,D);
[Bt{1} Bt{2}; Bt{3} Bt{4}]

t = linspace(0,1);
clf
hold on
plot(D(:,1),D(:,2),'ko-','MarkerFaceColor','k','MarkerSize',8);
for i = 1:4
    plotbezier(Be{i},t);
    plotbezier(Bc{i},t);
    plotbezier(Bt{i},t);
end
hold off
