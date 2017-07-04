function distortion = QuantizerDistortion(n)
%QuantizerDistortion gives an experimental value for the quantizer's 
%   distortion, using the mean-square value.
source   = GenerateUniform(n);
l  = numel(source);
er = zeros(size(source));
for i = 1:l
    if (source(i) < 1)
        er(i) = source(i) - .5;
    elseif (source(i) < 2)
        er(i) = source(i) - 1.5;
    elseif (source(i) < 3)
        er(i) = source(i) - 2.5;
    else % source(i) < 4
        er(i) = source(i) - 3.5;
    end
end
square_er  = er.^2;
distortion = mean(square_er);
end