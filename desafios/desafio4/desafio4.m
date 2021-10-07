clear

gamma16 = 1;
gamma17 = 0;
gamma18 = 8;

gamma26 = 2;
gamma27 = 1;
gamma28 = 9;

tamanhoy = 20;

n = 0:tamanhoy;

y = 50*0.5.^n + 45.12.*n.*0.8.^n - 30.72 * 0.8.^n;

#figure(1)
#plot(n, y)


function result = sistemay(v)
  if (v == -1)
    result = 2;
  elseif (v == -2)
    result = 1;
  else
    result = 1.6*sistemay(v-1)-0.64*sistemay(v-2) + 18*0.5^v;
  endif
endfunction

for i = 0:tamanhoy
  yrec(i+1) = sistemay(i);
endfor

#figure(2)
#plot(n, yrec)

[audio, fs] = audioread('som_T02_25.wav');
wc = 2*pi*fs;
omegac = wc/fs;

H0 = 10^(-3/20);
x0 = abs(e^(j*omegac));
alpha = (x0*(H0-1))/(H0-x0)

Hz = @(z) (1-alpha)*z/(z-alpha);
Fz = @(z) H(z).^20; 

w = 0:0.001:pi;
numhz = [1-alpha 0];
denhz = [1 -alpha];
htf = tf(numhz, denhz, -1);
ftf = htf^20;
[maghz, fasehz] = bode(htf, w);
[magfz, fasefz] = bode(ftf, w);
figure(3)
plot(w, 20*log10(maghz))
figure(4)
plot(w, 20*log10(magfz))