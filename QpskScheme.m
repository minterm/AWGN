function modulatedSignals = QpskScheme(messages)
%QpskScheme puts a vector of messages through a QPSK scheme
%   Ensures the symbol energy is 1 and uses Gray encoding
A = 1/sqrt(2);
symbols = zeros(size(messages));
% using Gray encoding
symbols(messages == 0.5) =  A*(1 + 1i); % 00
symbols(messages == 1.5) =  A*(1 - 1i); % 01
symbols(messages == 2.5) = -A*(1 + 1i); % 11
symbols(messages == 3.5) = -A*(1 - 1i); % 10
modulatedSignals = symbols;
end