function errorRate = Run2(SNR, n)
%Run2 is a simulation of a QPSK modulation scheme through an AWGN channel
% with error correction
%   SNR (provided in dB) represents the SNR of the AWGN channel
%   n is the number of messages to send through the simulation
source     = GenerateUniform(n);
messages   = Quantize(source);
qbits      = Msg2Bits(messages);

rbits      = CodeRepetition(qbits);
rMessages  = Bits2Msg(rbits);
rtx        = QPSKScheme(rMessages);
rrx        = AwgnChannel(rtx, SNR);
rdemod     = Demodulator(BDetector(rrx));
rRecBits   = Msg2Bits(rdemod);
rdecode    = DecodeRepetition(rRecBits);
rmsg       = Bits2Msg(rdecode);

hbits      = CodeHamming(qbits);
hMessages  = Bits2Msg(hbits);
htx        = QPSKScheme(hMessages);
hrx        = AwgnChannel(htx, SNR);
hdemod     = Demodulator(BDetector(hrx));
hRecBits   = Msg2Bits(hdemod);
hdecode    = DecodeHamming(hRecBits);
hmsg       = Bits2Msg(hdecode);

rber = ErrorRate('bit', rmsg, messages)/(2*n);
hber = ErrorRate('bit', hmsg, messages)/(2*n);
errorRate = [rber hber];
end