function res = creatingReceivedBitSequence(inputBitSequence, type)

bitSequence = inputBitSequence;

[symbol, bitSequence] = fetchSymbol(bitSequence, type);
while(symbol ~= -1)
    point = symbol2Point( symbol, type );
    
    
    [symbol, bitSequence] = fetchSymbol(bitSequence, type);
end




end