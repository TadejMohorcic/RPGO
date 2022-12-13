function plotbezier3(Bx,By,Bz,d)

[TRI, U] = trimeshgrid(d);
b = bezier3(Bx,By,Bz,U);

BX = Bx';
BX = BX(:);
BX = BX(~isnan(BX));

BY = By';
BY = BY(:);
BY = BY(~isnan(BY));

BZ = Bz';
BZ = BZ(:);
BZ = BZ(~isnan(BZ));

tri = triangulation(TRI, b);

colormap spring
trisurf(tri);
hold on
trimesh(trimeshgrid(3),BX,BY,BZ,'FaceColor','None','EdgeColor','#272946');
hold on
scatter3(BX,BY,BZ,'MarkerEdgeColor','#272946','MarkerFaceColor','#eda031');

end