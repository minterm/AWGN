function corrected = DecodeHamming(dbits)
%DecodeHamming decodes a (7, 4) Hamming code
l         = numel(dbits);
corrected = zeros(1, (4/7)*l);
H         = [1 0 1 0 1 0 1;
             0 1 1 0 0 1 1;
             0 0 0 1 1 1 1];
R         = [0 0 1 0 0 0 0;
             0 0 0 0 1 0 0;
             0 0 0 0 0 1 0;
             0 0 0 0 0 0 1];
k     = 1;
i     = 1;
while i < l
    r = [dbits(i); dbits(i + 1); dbits(i + 2); dbits(i + 3);
         dbits(i + 4); dbits(i + 5); dbits(i + 6)];
    z = mod((H*r), 2);
    if (~isequal(z, [0; 0; 0])) % fix a bit error
        indx = 1;
        for j = 1:7
            if (isequal(H(:, j), z))
                indx = j;
                break;
            end
        end
        r(indx) = ~r(indx);
    end
    x = mod((R*r), 2)';
    corrected(k)     = x(1);
    corrected(k + 1) = x(2);
    corrected(k + 2) = x(3);
    corrected(k + 3) = x(4);
    k = k + 4;
    i = i + 7;
end
end