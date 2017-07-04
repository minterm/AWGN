function out = PlotQpsk(symbols, ttitle)
%PlotQpsk plots symbols
plot(real(symbols), imag(symbols), '.');
xlim([-2 2]);
ylim([-2 2]);
title(ttitle);
xlabel('real part');
ylabel('imaginary part');
out = 1;
end