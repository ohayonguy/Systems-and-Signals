close all;
clear;
clc;

%% Section 1.1
% Load the data
load EcgData.mat
% Create time
Ts = 1/Fs;
t = linspace(0, length(vEcg) * Ts, length(vEcg));
% Plot the graph
figure(1); grid on; hold on;
plot(t, vEcg);
title('Ecg as a function of time'); xlabel('time'); ylabel('Ecg');

%% Section 1.2
xs = vEcg;
N = length(vEcg);
th = pi * linspace(-1, 1, N + 1)'; th(end) = [];
w = th * Fs;
vEcgF = fftshift((fft(vEcg))) / sqrt(N);

figure;
subplot(2,1,1); hold on; grid on; set(gca, 'FontSize', 16);
plot(th, abs(vEcgF), 'g', 'LineWidth', 2);
title('$|X_s^f(\theta)|$', 'Interpreter', 'latex');
xlabel('$\theta$', 'Interpreter', 'latex');
subplot(2,1,2); hold on; grid on; set(gca, 'FontSize', 16);
plot(w, abs(vEcgF), 'b', 'LineWidth', 2);
title('$|\tilde{X}_s^F(\omega)|$', 'Interpreter', 'latex');
xlabel('$\omega$', 'Interpreter', 'latex');

z = xs - mean(xs);
Zf = fftshift((fft(z))) / sqrt(N);
figure;
hold on; grid on; set(gca, 'FontSize', 16);
plot(w, abs(Zf), 'g', 'LineWidth', 2);
title('$|\tilde{Z}^f(\omega)|$', 'Interpreter', 'latex');
xlabel('$\omega$', 'Interpreter', 'latex');

%% Section 1.3
figure; plot(w, abs(vEcgF));
axis([60, 100, 0, 1.5]);

%% Section 1.4
eps = 0.26;
Xf = fftshift((fft(xs))) / sqrt(N);
psi = (Xf >= eps) .* Xf;
vY = ifft(ifftshift(psi)) * sqrt(N);

%% Section 1.5
figure;
ax(1) = subplot(2,1,1); plot(t, vEcg, 'b', 'LineWidth', 2); title('Unfiltered Ecg', 'Interpreter', 'latex'); xlabel('time', 'Interpreter', 'latex');
ax(2) = subplot(2,1,2); plot(t, vY, 'r', 'LineWidth', 2); title('Filtered Ecg', 'Interpreter', 'latex'); xlabel('time', 'Interpreter', 'latex');
linkaxes(ax, 'x');