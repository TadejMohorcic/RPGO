f = @(x,y) 3*(1-x).^2.*exp(-x.^2 - (y+1).^2) ...
- 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
- 1/3*exp(-(x+1).^2 - y.^2);


dxf = @(x,y) (exp(-(x + 1)^2 - y^2)*(2*x + 2))/3 ...
+ 3*exp(- (y + 1)^2 - x^2)*(2*x - 2) ...
+ exp(- x^2 - y^2)*(30*x^2 - 2) ...
- 6*x*exp(- (y + 1)^2 - x^2)*(x - 1)^2 ...
- 2*x*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5);

dyf = @(x,y) (2*y*exp(- (x + 1)^2 - y^2))/3 ...
+ 50*y^4*exp(- x^2 - y^2) ...
- 3*exp(- (y + 1)^2 - x^2)*(2*y + 2)*(x - 1)^2 ...
- 2*y*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5);

Df = @(x,y) [dxf(x,y); dyf(x,y)];


dxxf = @(x,y) (2*exp(- (x + 1)^2 - y^2))/3 ...
+ 6*exp(- (y + 1)^2 - x^2) ...
+ 60*x*exp(- x^2 - y^2) ...
- 6*exp(- (y + 1)^2 - x^2)*(x - 1)^2 ...
- 2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) ...
- (exp(- (x + 1)^2 - y^2)*(2*x + 2)^2)/3 ...
+ 12*x^2*exp(- (y + 1)^2 - x^2)*(x - 1)^2 ...
+ 4*x^2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) ...
- 12*x*exp(- (y + 1)^2 - x^2)*(2*x - 2) ...
- 4*x*exp(- x^2 - y^2)*(30*x^2 - 2);

dxyf = @(x,y) 4*x*y*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) ...
- (2*y*exp(- (x + 1)^2 - y^2)*(2*x + 2))/3 ...
- 2*y*exp(- x^2 - y^2)*(30*x^2 - 2) ...
- 100*x*y^4*exp(- x^2 - y^2) ...
- 3*exp(- (y + 1)^2 - x^2)*(2*x - 2)*(2*y + 2) ...
+ 6*x*exp(- (y + 1)^2 - x^2)*(2*y + 2)*(x - 1)^2;

dyyf = @(x,y) (2*exp(- (x + 1)^2 - y^2))/3 ...
- 6*exp(- (y + 1)^2 - x^2)*(x - 1)^2 ...
- 2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) ...
+ 200*y^3*exp(- x^2 - y^2) ...
- 200*y^5*exp(- x^2 - y^2) ...
- (4*y^2*exp(- (x + 1)^2 - y^2))/3 ...
+ 4*y^2*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5) ...
+ 3*exp(- (y + 1)^2 - x^2)*(2*y + 2)^2*(x - 1)^2;

Hf = @(x,y) [dxxf(x,y) dxyf(x,y); dxyf(x,y) dyyf(x,y)];

T = [-1.7 -1; -0.5 -1; -0.5 0];
Bz = argyris(T,f,Df,Hf)

[Bx,By] = deal(NaN(6));
for i = 0:5
    for j = 0:5-i
        D = (5-i-j)/5*T(1,:) + j/5*T(2,:) + i/5*T(3,:);
        Bx(i+1,j+1) = D(1);
        By(i+1,j+1) = D(2);
    end
end
[~,U3] = trimeshgrid(3);
bezier3(Bx,By,Bz,U3)

[TRI,U50] = trimeshgrid(50);
X = U50(:,1)*T(1,1) + U50(:,2)*T(2,1) + U50(:,3)*T(3,1);
Y = U50(:,1)*T(1,2) + U50(:,2)*T(2,2) + U50(:,3)*T(3,2);
Z = f(X,Y);
b = bezier3(Bx,By,Bz,U50);

% maksimalna absolutna napaka
max(max(abs(Z-b(:,3))))

% izris
trisurf(TRI,X,Y,Z);
trisurf(TRI,b(:,1),b(:,2),b(:,3));
