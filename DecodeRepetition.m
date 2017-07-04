function corrected = DecodeRepetition(dbits)
%DecodeRepetition attempts to correct errors using repetition encoding
l         = numel(dbits);
corrected = zeros(1, l/3);
k = 1;
for i = 1:numel(corrected)
    a = 0; % # of 0
    b = 0; % # 0f 1
    for j = k:k+2
        if (dbits(j) == 0)
            a = a + 1;
        else % dbits(j) == 1
            b = b + 1;
        end
    end
    if (a > b)
        corrected(i) = 0;
    else
        corrected(i) = 1;
    end
    k = k + 3;
end
end