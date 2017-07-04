function source = GenerateUniform(amount)
%GenerateUniform generate the given amount of random variables
%   Variables are distributed uniformly over (0,4)
source = 4*rand(1, amount);
end