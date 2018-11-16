close all;
clear;
clc;

%% 3
N = 10;
t = linspace(-pi, pi, N + 1)'; t(end) = [];
x = t;

figure(1); hold on; grid on;
plot(t, x, 'b', 'LineWidth', 1);
legend('x(t)');

%% 5
M = 1;
T0 = 2*pi;
k = -M : M;
om0 = (2*pi)/T0;
F = exp(1j * om0 * t * k);
X = F' * x / N;

%% 6
X_fourier = Fourier(M,t,x,N);
figure(2); hold on; grid on;
plot(t, x, 'b', 'LineWidth', 1);
plot(t, X_fourier, 'r', 'LineWidth', 1);
legend('x-original(t)', 'x-fourier(t)');

%% 7

X_fourier_M_1 = Fourier(1,t,x,N);
X_fourier_M_5 = Fourier(5,t,x,N);
X_fourier_M_30 = Fourier(30,t,x,N);

X_fourier_M_1 = cat(1,X_fourier_M_1,X_fourier_M_1,X_fourier_M_1);
X_fourier_M_5 = cat(1,X_fourier_M_5,X_fourier_M_5,X_fourier_M_5);
X_fourier_M_30 = cat(1,X_fourier_M_30,X_fourier_M_30,X_fourier_M_30);
t = cat(1,t-2*pi,t,t+2*pi);
x = cat(1,x,x,x);

figure(3); hold on; grid on;
plot(t, x, '-black', 'LineWidth', 1);
plot(t, X_fourier_M_1, 'b', 'LineWidth', 1);
plot(t, X_fourier_M_5, 'r', 'LineWidth', 1);
plot(t, X_fourier_M_30, 'y', 'LineWidth', 1);
legend('x(t)', '1', '5', '30');

%% 8
M = 100;
K = 1 : M;
Fourier_Matrix = Fourier(.K,t,x,N);

%% functions
function X_fourier = Fourier(M,t,x,N)
    T0 = 2*pi;
    M
    k = -M : M;
    om0 = (2*pi)/T0;
    F = exp(1j * om0 * t * k);
    X = F' * x / N;
    X_fourier = F * X;
end

