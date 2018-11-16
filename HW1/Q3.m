close all;
clear;
clc;

%% 3.2 - 1
N = 1000;
t = linspace(-1, 1, N + 1)'; t(end) = [];

%% 3.2 - 2
x1 = sin(2*pi * 1/2 * t);
x2 = sin(2*pi * 2/2 * t);
x3 = sin(2*pi * 3/2 * t);
x4 = sin(2*pi * 4/3 * t);

%% 3.2 - 3
figure(1); hold on; grid on;
plot(t, x1, 'b', 'LineWidth', 1);
plot(t, x2, 'r', 'LineWidth', 1);
plot(t, x3, 'g', 'LineWidth', 1);
plot(t, x4, 'y', 'LineWidth', 1);
legend('x1(t)', 'x2(t)','x3(t)','x4(t)');

%% 3.2 - 4
T0=2;

X = [x1, x2, x3, x4];
G = X' * X / N;

%% 3.3 - 1
x=3*sin(2*pi*t)+7*cos(2*pi*2*t)+5*sin(2*pi*3*t);

%% 3.3 - 3
s1 = 2 * sin(2*pi * 1 * t);
s2 = 2 * sin(2*pi * 2 * t);
s3 = 2 * sin(2*pi * 3 * t);
c1 = 2 * cos(2*pi * 1 * t);
c2 = 2 * cos(2*pi * 2 * t);
c3 = 2 * cos(2*pi * 3 * t);

G2 = [s1,s2,s3,c1,c2,c3];
G = G2' * x / N