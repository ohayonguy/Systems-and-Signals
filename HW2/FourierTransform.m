% Fourier Transform Implementation
function Xf = FourierTransform(x, t, w)
    F = [exp(j*t*(w.'))];
    Xf = F' * x * (t(2)-t(1));
end