clear
# geração de imagens
quarta_questao = false;
quinta_questao = false;
sexta_questao = false;
setima_questao = false;
nona_questao = true;
decima_questao = true;
imgn = 1; # contador imagens
# Primeira Questão
gamma16 = 1;
gamma17 = 0;
gamma18 = 8;

gamma26 = 2;
gamma27 = 1;
gamma28 = 9;

# Segunda Questão
theta = pi/4 + ((4*pi)/80)*gamma18;

#Terceira Questão
r = 0.95;

b0 = 1;
b1 = -2*cos(theta);
b2 = 1;

a0 = 1;
a1 = 2*r*cos(theta);
a2 = r^2;

# Quarta Questão
w = -3.2:0.001:3.2;
H=abs(b0+b1*exp(-i*w)+b2*exp(-2*i*w))./abs(a0+a1*exp(-i*w)+a2*exp(-2*i*w));

if quarta_questao
  figure(imgn)
  plot(w, 20*log10(H),'linewidth',2)
  imgn = imgn+1
endif

# Quinta questão
num=[b0 b1 b2];
den=[a0 a1 a2];

[mag, fase] = bode(tf(num,den,-1), w);

if quinta_questao
  figure(imgn)
  plot(w, 20*log10(mag),'linewidth',2)
  imgn = imgn+1
  figure(imgn)
  plot(w, fase,'linewidth',2)
  imgn = imgn+1
endif
# Sexta Questão

theta = pi()/4;
b1 = -2*cos(theta);
a1 = 2*r*cos(theta);
num=[b0 b1 b2];
den=[a0 a1 a2];
[mag1, fase1] = bode(tf(num,den,-1), w);
theta = pi()/2;
b1 = -2*cos(theta);
a1 = 2*r*cos(theta);
num=[b0 b1 b2];
den=[a0 a1 a2];
[mag2, fase2] = bode(tf(num,den,-1), w);
theta = 3*pi()/4;
b1 = -2*cos(theta);
a1 = 2*r*cos(theta);
num=[b0 b1 b2];
den=[a0 a1 a2];
[mag3, fase3] = bode(tf(num,den,-1), w);
if sexta_questao
  figure(imgn)
  hold on
  plot(w, 20*log10(mag1),'linewidth',2, 'r')
  plot(w, 20*log10(mag2),'linewidth',2, 'g')
  plot(w, 20*log10(mag3),'linewidth',2, 'b')
  imgn = imgn+1
  figure(imgn)
  hold on
  plot(w, fase1,'linewidth',2, 'r')
  plot(w, fase2,'linewidth',2, 'g')
  plot(w, fase3,'linewidth',2, 'b')
  imgn = imgn+1
endif
# Sétima questão

theta = pi()/4 + ((4*pi())/80)*gamma18;
b1 = -2*cos(theta);

r = 0.8;
a1 = 2*r*cos(theta);
a2 = r^2;
num=[b0 b1 b2];
den=[a0 a1 a2];
[mag1, fase1] = bode(tf(num,den,-1), w);

r = 0.9;
a1 = 2*r*cos(theta);
a2 = r^2;
num=[b0 b1 b2];
den=[a0 a1 a2];
[mag2, fase2] = bode(tf(num,den,-1), w);

r = 0.95;
a1 = 2*r*cos(theta);
a2 = r^2;
num=[b0 b1 b2];
den=[a0 a1 a2];
[mag3, fase3] = bode(tf(num,den,-1), w);
if setima_questao
  figure(imgn)
  hold on
  plot(w, 20*log10(mag1),'linewidth',2, 'r')
  plot(w, 20*log10(mag2),'linewidth',2, 'g')
  plot(w, 20*log10(mag3),'linewidth',2, 'b')
  imgn = imgn+1
  figure(imgn)
  hold on
  plot(w, fase1,'linewidth',2, 'r')
  plot(w, fase2,'linewidth',2, 'g')
  plot(w, fase3,'linewidth',2, 'b')
  imgn = imgn+1
endif
# Oitava questão
theta = pi/4 + ((4*pi)/80)*gamma18;
r = 0.95;
a0 = 1;
a1 = -2*r*cos(theta);
a2 = r^2;
b0 = 1;
b1 = -2*cos(theta);
b2 = 1;

beta = (a0+a1*exp(-i*0)+a2*exp(-2*i*0))/(b0+b1*exp(-i*0)+b2*exp(-2*i*0));

# Nona questão

ntotal = 80*pi/theta;
omega0 = theta;
a0 = 1;
a1 = -2*r*cos(theta);
a2 = r^2;
b0 = 1*beta;
b1 = -2*cos(theta)*beta;
b2 = 1*beta;

xmenosdois = 0;
xmenosum = 0;
ymenosdois = 0;
ymenosum = 0;
y = zeros(1, ntotal+1);
for n = 0:ntotal
  x(n+1) = 1.5 + sin(omega0*n+pi/3) ...
  + sin(0.5*omega0*n-pi) ...
  + cos(omega0*n+3*pi/2);
  y(n+1) = 2*r*cos(theta)*ymenosum ...
  - r^2*ymenosdois ...
  + beta*x(n+1) ...
  - 2*cos(theta)*beta*xmenosum ...
  + beta*xmenosdois;
  v(n+1) = 1.5 + sin(0.5*omega0*n - pi);
  xmenosdois = xmenosum;
  xmenosum = x(n+1);
  ymenosdois = ymenosum;
  ymenosum = y(n+1);
endfor

if nona_questao
  figure(imgn)
  plot(0:123, x)
  imgn = imgn+1
  figure(imgn)
  hold on
  plot(0:123, y, 'r')
  plot(0:123, v, 'g')
  imgn = imgn+1
endif
# Decima questao

num=[b0 b1 b2];
den=[a0 a1 a2];

yf = filter(num, den, x);

if decima_questao
  figure(imgn)
  hold on
  plot(0:123, yf, 'r')
  plot(0:123, v, 'g')
  imgn = imgn+1
endif