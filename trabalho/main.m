clear
pkg load control
questao5 = false;
questao6 = false;
questao7 = false;
questao8 = true;
questao10 = false;

R = 2;
L = 1;
C = 9;

figcount = 0;

A = [-1*(R/L) 0; 0 -2/(R*C)];
B = [1/L; 1/(R*C)];
C = [0 -1];
D = 1;


[autovetores, autovalores] = eig(A);
% questao 4
cmax = -1/9;
Tsim = -8/cmax;
t = 0.01:0.01:Tsim;
u = ones(size(t));
x0 = [1;1];
y = (((-1/2).*exp((-1/9).*t))+(1/2));
[ysim, t, Xsim] = lsim(ss(A,B,C,D),u,t,x0);
% questao 5
if questao5
  figcount+=1;
  figure(figcount)
  plot(t, ysim, 'g', 'linewidth', 2)
  hold on
  plot(t, y, '--b', 'linewidth', 2)
endif

% questao 6

T = [0 -2/R; -R 0 ];
[ysim2,t,Zsim] = lsim(ss(T*A*inv(T),T*B,C*inv(T),D), u,t,T*x0);
if questao6
  figcount+=1;
  figure(figcount)
  plot(t, ysim, 'g', 'linewidth', 2)
  hold on
  plot(t, ysim2, '--b', 'linewidth', 2)
endif

% questao 7
if questao7
  figcount+=1;
  figure(figcount)
  plot(t, Xsim(:,1), 'g', 'linewidth', 2)
  hold on
  plot(t, Zsim(:,1), '--b', 'linewidth', 2)
  figcount+=1;
  figure(figcount)
  plot(t, Xsim(:,2), 'g', 'linewidth', 2)
  hold on
  plot(t, Zsim(:,2), '--b', 'linewidth', 2)
endif

% questao 8

x0 = [1; 1];
[ysim1,t,Xsim1] = lsim(ss(A,B,C,D), zeros(size(u)),t,x0);
x0 = [1; 0];
[ysim2,t,Xsim2] = lsim(ss(A,B,C,D), zeros(size(u)),t,x0);
if questao8
  figcount+=1;
  figure(figcount)
  plot(Xsim1(:,1), Xsim1(:,2), 'k', 'linewidth', 2)
  figcount+=1;
  figure(figcount)
  plot(Xsim2(:,1), Xsim2(:,2), 'k', 'linewidth', 2)
endif
% questao 10

P = [1/4 0; 0 9/2];
XsimT = Xsim';
for count = 1:length(Xsim)
V(count) = Xsim(count,:)*P*XsimT(:,count);
endfor
if questao10
figcount+=1;
figure(figcount)
plot(t, V, 'k', 'linewidth', 2)
endif
% questao 11
AB = A*B;
controlavel = [B, AB];
detcontrolavel = det(controlavel)

CA = C*A;
observavel = [C; CA]';
detobservavel = det(observavel)

