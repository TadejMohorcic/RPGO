function Be = bezierelv(B,k)
% funkcija bezierelv izvede višanje stopnje dane Bezierjeve krivulje za k
% točk

n = size(B,1);
m = size(B,2);
A = zeros(n+1,m);

for i = 1:m
    A(1,i) = B(1,i);
    A(n+1,i) = B(n,i);
end

for i = 1:m
    for j = 2:n
        A(j,i) = (1-(j-1)/n)*B(j,i) + (j-1)/n*B(j-1,i);
    end
end

if k == 1
    Be = A;

else
    Be = bezierelv(A,k-1);

end