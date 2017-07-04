function qbits = Msg2Bits(messages)
%Msg2Bits turns Gray encoded symbols to a binary string
l     = numel(messages);
qbits = zeros(1, 2*l);
k     = 1;
for i = 1:l
    if (messages(i) == 0.5)
        qbits(k)     = 0;
        qbits(k + 1) = 0;
    elseif (messages(i) == 1.5)
        qbits(k)     = 0;
        qbits(k + 1) = 1;
    elseif (messages(i) == 2.5)
        qbits(k)     = 1;
        qbits(k + 1) = 1;
    else % (messages(i) == 3.5)
        qbits(k)     = 1;
        qbits(k + 1) = 0;
    end
    k = k + 2;
end
end