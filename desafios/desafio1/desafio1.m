clear

gama16 = 1;
gama17 = 0;
gama18 = 8;

gama26 = 2;
gama27 = 1;
gama28 = 9;


rmin = min(gama16,gama17);
rmax = max(gama16,gama17);

dmin = min(gama26,gama27);
dmax = max(gama26,gama27);

alpha = (gama18 +1)/10;
beta = (gama28 +1)/10;

n1 = dmin + rmin + 2;
n2 = dmin + rmin + 5;

n = -5:5;
xn = alpha.^n.*(n>=rmin&n<rmax);
hn = beta.^n.*(n>=dmin&n<dmax);

figure(1)
stem(-5:5, xn)

figure(2)
stem(-5:5, hn)

y = conv(xn, hn);

figure(3)
stem(-5:5, y(6:16))