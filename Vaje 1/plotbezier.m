function plotbezier(B,t)
% funkcija plotbezier nariše Bezierjevo krivuljo za dane kontrolne točke in
% seznam parametrov

clf
hold on
axis equal

b = bezier(B,t);
plot(B(:,1),B(:,2),'Color',[0 0 0]);
scatter(B(:,1),B(:,2),50,'MarkerEdgeColor',[0.6350 0.0780 0.1840],...
              'MarkerFaceColor',[0.8500 0.3250 0.0980],...
              'LineWidth',1.5);

plot(b(:,1),b(:,2),'Color',[0 0.4470 0.7410]);

end