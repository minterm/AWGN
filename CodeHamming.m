function coded = CodeHamming(qbits)
%CodeHamming uses (7, 4) Hamming code on a bit sequence
l     = numel(qbits);
coded = zeros(1, (7/4)*l); % need l a multiple of 100.
G     = [1 1 0 1;
         1 0 1 1;
         1 0 0 0;
         0 1 1 1;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
k     = 1;
i     = 1;
while i < l
    p = [qbits(i); qbits(i + 1); qbits(i + 2); qbits(i + 3)];
    x = mod((G*p), 2)';
    coded(k)     = x(1);
    coded(k + 1) = x(2);
    coded(k + 2) = x(3);
    coded(k + 3) = x(4);
    coded(k + 4) = x(5);
    coded(k + 5) = x(6);
    coded(k + 6) = x(7);
    k = k + 7;
    i = i + 4;
end
end