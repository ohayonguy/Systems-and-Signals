close all;
clear;
clc;

%% Section 2.1
figure;
for ii = 1 : 9
Fs = 6250 - (ii-1) * 500;
Ts = 1 / Fs;
T = 1;
t = 0 : Ts : T; t(end) = [];
x = cos(2 * pi * 2000 * t);
N = length(x);
f = Fs / 2 * linspace(-1, 1, N + 1); f(end) = [];
Xf = fftshift((fft(x))) / sqrt(N);
subplot(3,3,ii); grid on; hold on; set(gca, 'FontSize', 14);
plot(f, abs(Xf), 'LineWidth', 2);
title(['$f_s = ', num2str(Fs), '$'], 'Interpreter', 'latex');
xlabel('$\omega$', 'Interpreter', 'latex');
ylabel('$X_{s}^{f}\left(\omega T_{s}\right)$', 'Interpreter', 'latex');
xlim([-3000, 3000]);
sPlay = audioplayer(x, Fs);
playblocking(sPlay)
end

%% Section 2.2
Fs = 1000;
Ts = 1 / Fs;
T = 4;
t = 0 : Ts : T;
x = cos(2 * pi * 100 .* t .* t);
figure; spectrogram(x, Fs/10, Fs/20, 2^10, Fs, 'Yaxis');
sPlay = audioplayer(x, Fs);
playblocking(sPlay)
