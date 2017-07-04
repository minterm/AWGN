function er = ErrorRate(symbolOrBit, demodulated, messages)
%ErrorRate returns an error count (either bit or symbol)
%   Note: the count must still be divided by total count sent
if (strcmp(symbolOrBit,'symbol'))
    er = numel(find(demodulated ~= messages));
else % symbolOrBit = 'bit'
    l  = numel(messages);
    er = 0;
    for i = 1:l
        if (demodulated(i) ~= messages(i))
            if (demodulated(i) == 0.5)
                if (messages(i) == 1.5 || messages(i) == 3.5)
                    er = er + 1;
                else % (messages(i) == 2.5)
                    er = er + 2;
                end
            elseif (demodulated(i) == 1.5)
                if (messages(i) == 0.5 || messages(i) == 2.5)
                    er = er + 1;
                else % (messages(i) == 3.5)
                    er = er + 2;
                end
            elseif (demodulated(i) == 2.5)
                if (messages(i) == 1.5 || messages(i) == 3.5)
                    er = er + 1;
                else % (messages(i) == 0.5)
                    er = er + 2;
                end
            else % demodulated(i) == 3.5
                if (messages(i) == 0.5 || messages(i) == 2.5)
                    er = er + 1;
                else % (messages(i) == 1.5)
                    er = er + 2;
                end
            end
        end
    end
end
end