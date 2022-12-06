P = [-5 0; -2 -1; 0 3; 3 0; 7 -1];

ue = alphaparam(P,0)
uc = alphaparam(P,0.5)
ut = alphaparam(P,1)

z = zeros(1,5);
subplot(3,1,1);
plot(ue,z,'ro-','MarkerEdgeColor','k','MarkerFaceColor','k');

subplot(3,1,2);
plot(uc,z,'go-','MarkerEdgeColor','k','MarkerFaceColor','k');

subplot(3,1,3);
plot(ut,z,'bo-','MarkerEdgeColor','k','MarkerFaceColor','k');