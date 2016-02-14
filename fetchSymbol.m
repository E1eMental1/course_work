function [symbol, trimmedBitSequence] = fetchSymbol( bitSequence, type )

if( strcmp(type, 'BPSK') == 1)
    symbolLength = 1;
end

if(length(bitSequence) < symbolLength)
    symbol = -1;
    trimmedBitSequence = bitSequence;
else
    symbol = bitSequence(1:symbolLength);
    trimmedBitSequence = bitSequence((symbolLength + 1) : length(bitSequence));
end
end

