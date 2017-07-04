function received = QpskDetector(rx)
%QpskDetector detects which QPSK symbol the received values are
%   Ensures the symbol energy is 1 and uses Gray encoding
l = numel(rx);
received = zeros(1, l);
A = 1/sqrt(2);
for i = 1:l
    if (real(rx(i)) >= 0)
        if (imag(rx(i)) >= 0)
            received(i) = A*(1 + 1i); % 00
        else
            received(i) = A*(1 - 1i); % 01
        end
    else
        if (imag(rx(i)) >= 0)
            received(i) = -A*(1 - 1i); % 10
        else
            received(i) = -A*(1 + 1i); % 11
        end
    end
end
end