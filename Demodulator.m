function messages = Demodulator(received)
%Demodulator turns detected signals into messages
%   Reverses the process of the function QpskScheme
A  = 1/sqrt(2);
m0 =  A*(1 + 1i); % 00
m1 =  A*(1 - 1i); % 01
m2 = -A*(1 + 1i); % 11
m3 = -A*(1 - 1i); % 10
messages = zeros(size(received));
messages(received == m0) = 0.5; 
messages(received == m1) = 1.5; 
messages(received == m2) = 2.5;
messages(received == m3) = 3.5;
end