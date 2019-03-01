function note = MakeNote(n, T, dt)
f0 = 440;
tau = 0.4;
t = 0 : dt : T; t(end) = [];
note = cos(2*pi.*t*(2^(n/12))*f0).*exp(-t/tau);
note = note.';
end