function rx = AwgnChannel(tx, snr)
%AwgnChannel adds complex additive white Gaussian noise to a transmission
% Variance of the noise is N0/2
% SNR = Es/N0 (per symbol)
% var = Es/(2*SNR)
snr   = 10^(snr/10);
Es    = abs(tx(1));
var   = Es/(2*snr);
sigma = sqrt(var);
rv1   = randn(1, numel(tx));
rv2   = randn(1, numel(tx));
awgn  = (sigma/sqrt(2)).*complex(rv1,rv2); % change to SNR per bit
rx    = tx + awgn;
end