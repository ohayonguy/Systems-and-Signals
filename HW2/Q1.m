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

%% Random Test:
x = randn(N, 1) + 1j * randn(N, 1);
Xf = FourierTransform(x, t, w);
norm(x - InvFourierTransform(Xf, w, t))

%% 1.4.2
syms x(t1);
x(t1) = 2*cos(2*pi*3*t1)+3*sin(2*pi*7*t1);
x = eval(x(t));
Xf = FourierTransform(x,t,w);

%% Section 4
figure;
subplot(3,1,1);
plot(t, x); grid on;
title('x(t)'); xlabel('t');
subplot(3,1,2);  grid on;
stem(w, abs(Xf));
title('|X_F(w)|'); xlabel('w');
subplot(3,1,3);  grid on;
plot(t, x); hold on;
plot(t, real(InvFourierTransform(Xf, w, t)));
xlabel('t');
legend('x(t)','$\hat{x}$(t)','Interpreter','latex');

%% Section

