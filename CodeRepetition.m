function coded = CodeRepetition(qbits)
%CodeRepetition triples each bit in qbits
l     = numel(qbits);
coded = zeros(1, 3*l);
k     = 1;
for i = 1:l
    m = qbits(i);
    coded(k)     = m;
    coded(k + 1) = m;
    coded(k + 2) = m;
    k = k + 3;
end
end