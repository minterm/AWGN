function messages = Bits2Msg(qbits)
%Bits2Msg turns a binary string to Gray encoded symbols
l        = numel(qbits);
messages = zeros(1, l/2);
k        = 1;
for i = 1:numel(messages)
    j = k + 1;
    if (qbits(k) == 0)
        if (qbits(j) == 0)
            messages(i) = 0.5; % 00
        else
            messages(i) = 1.5; % 01
        end
    else
        if (qbits(j) == 0)
            messages(i) = 3.5; % 10
        else
            messages(i) = 2.5; % 11
        end
    end
    k = k + 2;
end
end