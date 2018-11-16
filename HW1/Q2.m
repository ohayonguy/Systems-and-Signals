close all;
clear;
clc;

%% 2.1

N=1000;
t=linspace(0, 10, N+1);
t(end)=[];

x=2*sin(2*pi*0.2*t)+0.5*cos(2*pi*3*t);

y=ThresholdSystem(x);
figure(1); hold on; grid on;
plot(t, x, 'b', 'LineWidth', 2);
plot(t, y, ':r', 'LineWidth', 2);
legend('x(t)', 'y(t)');

%% 2.2

x = sin(2*pi *.1 * t) + randn(1, N) / 10;
[y, ty] = MovingAverage(x, t);
figure; hold on; grid on;
plot(t, x, 'b', 'LineWidth', 1)
plot(ty, y, 'r', 'LineWidth', 2)
legend('x(t)', 'y(t)');





%% functions

%function for 2.1
function y = ThresholdSystem(x)
%-- Input: vector x
%-- Output: vector y, y = Psi{x}
    y(x > 1) = 1;
    y(x < -1) = -1;
    y(abs(x) <= 1) = x(abs(x) <= 1);
end

%function for 2.2
function [y, t2] = MovingAverage(x, t)
    %-- Input: 1. x - input vector.
    %-- 2. t - time vector.
    %-- Output: 1. y - output vector s.t. y = Psi{x}.
    %-- 2. t - valid output time vector.
    Ts = t(2) - t(1);
    Fs = round(1 / Ts);
    
    X = cumsum(x) * Ts;
    X1 = X(2*Fs+1 : end);
    X2 = X(1 : end-2*Fs);
    t2 = t(Fs+1 : end-Fs);
    y = 0.5*(X1 - X2);
end


