close all;
clear;
clc;

%% Sound Test
Fs = 2^16;
dt = 1 / Fs;
T = 1;
t = 0 : dt : T; t(end) = [];
%% Section 1
f0 = 500;
x = cos(2 * pi * f0 * t);
playblocking(audioplayer(x, Fs));

%% Section 3
%% C major
Fs = 2^13;
dt = 1 / Fs;
T = 0.4; %-- 0.4 [sec]
cMajor = [];
for n = [-9, -7, -5, -4, -2, 0, 2, 3, 2, 0, -2, -4, -5, -7, -9]
    cMajor = [cMajor; MakeNote(n, T, dt)];
end
playblocking(audioplayer(cMajor, Fs));

%% Section 4
x = [];
E = -5;
D = -7;
C = -9;

x = [];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(C, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(E, 2*T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(D, 2*T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(E, 2*T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(C, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(C, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(E, T, dt)];
x = [x; MakeNote(D, T, dt)];
x = [x; MakeNote(C, 2*T, dt)];
playblocking(audioplayer(x, Fs));

%% Section 5
N = length(x);
t = (0 : (N - 1))' * dt;
M = 2000;
f = linspace(0, 550, M)';

Xf = FourierTransform(x, t, 2*pi*f);
figure;
subplot(2,1,1);  
plot(t, x); hold on; grid on;
title('x(t)'); xlabel('t[sec]');

subplot(2,1,2);  
plot(f, abs(Xf)); hold on; grid on;
title('|X_F(f)|'); xlabel('f[Hz]');

%% Section 7
figure; spectrogram(x, round(T * Fs), 0, 2^11, Fs, 'Yaxis'); ylim([0 0.6]);

%% Section 8
load noise.mat %-- load noise (a row vector)
noise = noise(1:N)'; %-- noise -> column vector of length N
playblocking(audioplayer(noise, Fs));

%% Section 9
z = x + noise;
playblocking(audioplayer(z, Fs));

%% Section 10
M = 2000;
w = 2 * pi * linspace(0, 1000, M)';

Zf = FourierTransform(z, t, w);
figure;
subplot(2,1,1);  
plot(w, abs(Zf)); hold on; grid on;
title('|Z_F(w)|'); xlabel('w');

%% Section 11
t2 = (-2 : dt : 2)';
Sinc = @(t) sinc(t / pi);
h = (660/pi).*Sinc(660.*t2).*2.*cos(2240.*t2);
Hf = FourierTransform(h, t2, w);
subplot(2,1,1);  
plot(w, abs(Hf)); hold on; grid on;
title(''); legend('|Z_F(w)|','|H_F(w)|');

%% Section 12
y = conv(z, h, 'Same') * dt;
Yf = FourierTransform(y, t, w);
subplot(2,1,2);  
plot(w, abs(Yf)); hold on; grid on;
title('|Y_F(w)|'); xlabel('w');

%% Section 13
playblocking(audioplayer(y, Fs));