%% QPSK modulation through AWGN Channel with error correction 
%% by Micah Cliffe

% Get a plot for an SNR of 7
snr_1 = 7;
Run1(snr_1, 10000, 1);
% Get BER vs SNR plot
snr_log = 0:.1:10;
snr_lin = 10.^(snr_log/10);
theoretical_ber = .5*erfc(sqrt(2*snr_lin)/sqrt(2));
theoretical_ber = log10(theoretical_ber);
bers = zeros(size(snr_log));
n    = 1000000;
for i = 1:numel(snr_log)
    bers(i) = log10(Run1(snr_log(i), n, 0));
end
plot(snr_log, bers);
hold on;
plot(snr_log, theoretical_ber);
xlim([0 10]);
ylim([-6 0]);
title('BER vs SNR (1000000 Symbols Sent)');
xlabel('SNR (in dB)');
ylabel('log10(BER)');
legend('Experimental', 'Theoretical');
hold off;
% Calculate experimental distortion
n = 100;
QuantizerDistortion(n)

% With forward error correction
berR = zeros(size(snr_log));
berH = zeros(size(snr_log));
n     = 100000;
for i = 1:numel(snr_log)
    x = log10(Run2(snr_log(i), n));
    berR(i) = x(1);
    berH(i) = x(2);
end
plot(snr_log, berR);
hold on;
xlim([0 10]);
ylim([-3.5 -0.5]);
title('Encoding BER (100000 Symbols Sent)');
xlabel('SNR (in dB)');
ylabel('log10(BER)');
plot(snr_log, berH);
legend('Repetition', 'Hamming');
hold off;