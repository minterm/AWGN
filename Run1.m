function errorRate = Run(SNR, n, plot)
%Run1 is a simulation of a QPSK modulation scheme through an AWGN channel
%   SNR (provided in dB) represents the SNR of the AWGN channel
%   n is the number of messages to send through the simulation
%   plot tells the script whether to plot or not
source   = GenerateUniform(n);
messages = Quantize(source);
tx       = QpskScheme(messages);
rx       = AwgnChannel(tx, SNR);
title = sprintf('QPSK Constellation with Noise (%d Symbols, SNR = %d dB)', n, SNR);
if (plot == 1)
    PlotQpsk(rx, title);
end
received  = Demodulator(QpskDetector(rx));
ser       = ErrorRate('symbol', received, messages)/n;
ber       = ErrorRate('bit', received, messages)/(2*n);
errorRate = ber;
end