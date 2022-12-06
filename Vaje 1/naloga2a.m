% kontrolne točke Bezierjeve krivulje
B = [0 0; 1 2; 3 3; 4 -1; 0 2];

decasteljau(B(:,1),0)
decasteljau(B(:,2),0)
decasteljau(B(:,1),1)
decasteljau(B(:,2),1)
decasteljau(B(:,1),0.5)
decasteljau(B(:,2),0.5)