function digital = Quantize(source)
%Quantize quantizes the source
%   The source is quantized to four optimal levels: 0.5, 1.5, 2.5, 3.5
l       = numel(source);
digital = zeros(size(source));
for i = 1:l
   if (source(i) < 1)
       digital(i) = 0.5;
   elseif (source(i) < 2)
       digital(i) = 1.5;
   elseif (source(i) < 3)
       digital(i) = 2.5;
   else % source(i) < 4
       digital(i) = 3.5;
   end
end
end