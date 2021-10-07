clear
versusomegazao = true;
versusomegazinho = true;
versusf = true;
imgn = 1;
[y, fs] = audioread('som25.wav');

yd1 = y(1:8:end);
fs1 = fs/8;
yd2 = y(1:4:end);
fs2 = fs/4;
N = 1024;
Xk1 = fft(yd1, N);
Xk2 = fft(yd2, N);

k = 0:N-1;
omegazao = k.*(2*pi/N);
omegazinho1 = (k.*(2*pi/N))*fs1;
omegazinho2 = (k.*(2*pi/N))*fs2;
fs1vec = linspace(0, fs1, N);
fs2vec = linspace(0, fs2, N);
if versusomegazao
  figure(imgn)
  plot(omegazao(1:512), abs(Xk1)(1:512))
  imgn = imgn + 1;
  figure(imgn)
  plot(omegazao(1:512), abs(Xk2)(1:512))
  imgn = imgn + 1;
endif
if versusomegazinho
  figure(imgn)
  plot(omegazinho1(1:512), abs(Xk1)(1:512))
  imgn = imgn + 1;
  figure(imgn)
  plot(omegazinho2(1:512), abs(Xk2)(1:512))
  imgn = imgn + 1;
 endif
if versusf
  figure(imgn)
  plot(fs1vec(1:512), abs(Xk1)(1:512))
  imgn = imgn + 1;
   figure(imgn)
  plot(fs2vec(1:512), abs(Xk2)(1:512))
  imgn = imgn + 1;
endif