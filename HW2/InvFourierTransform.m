% Invert Fourier Transform
function x = InvFourierTransform(Xf, w, t)
    x = (1/(2*pi)) * FourierTransform(Xf, w, -t);
end
