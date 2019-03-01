close all;
clear;
clc;

%%
dt = 0.01;
Ws = 2 * pi / dt;
T = 1;
t = (-T : dt : T)'; t(end) = [];
N = length(t);
w = Ws / 2 * linspace(-1, 1, N + 1)'; w(end) = [];

syms x(t1);
x(t1) = 2*cos(2*pi*3*t1)+3*sin(2*pi*7*t1);
x = eval(x(t));
Xf = FourierTransform(x,t,w);

%% Section 2
w_1 = 6*pi;
w_2 = 14*pi;
w_c = (w_1 + w_2)/2;
A = w_c/pi;
Sinc = @(t) sinc(t / pi);

h = A * Sinc(w_c.*t);
Hf = FourierTransform(h,t,w);
Yf = Xf .* Hf;
y = InvFourierTransform(Yf, w, t);

%% Section 3
figure;

subplot(3,2,1);
plot(t, x); grid on; hold on; 
title('x(t)'); xlabel('t');

subplot(3,2,2);
stem(w, abs(Xf)); grid on; hold on; 
title('|X_F(w)|'); xlabel('w');
xlim([-200 200]);
ylim([0 4]);

subplot(3,2,3); 
plot(t, h); grid on; hold on; 
title('h(t)'); xlabel('t');
ylim([-10 10]);

subplot(3,2,4); 
plot(w, real(Hf)); hold on; grid on;
title('H_F(w)'); xlabel('w');
xlim([-200 200]);
ylim([-2 2]);

subplot(3,2,5);  
plot(t, real(y)); hold on; grid on;
title('y(t)'); xlabel('t');

subplot(3,2,6);  grid on; hold on;
stem(w, real(Yf)); 
plot(w, real(Hf));
stem(w, abs(Xf));
xlabel('w');
xlim([-200 200]);


legend('|X_F(w)|','H_F(w)','Y_F(w)');