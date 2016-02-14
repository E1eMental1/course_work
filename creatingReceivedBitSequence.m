function [res resizedInputBitSequence] = creatingReceivedBitSequence(inputBitSequence, type)

outputBitSequence = zeros(0);
bitSequence = inputBitSequence;

[symbol, bitSequence] = fetchSymbol(bitSequence, type);
while(symbol ~= -1)
    point = symbol2Point( symbol, type );%Получение точки из символа
    noisedPoint = noise(point);%Добавление шума
    roundedPoint = pointRound(noisedPoint, type);%определение ближайшей точки
    obtainedSymbol = point2Symbol(roundedPoint, type);%Полученый символ
    
    outputBitSequence = [outputBitSequence obtainedSymbol];
    
    [symbol, bitSequence] = fetchSymbol(bitSequence, type);
end
resizedInputBitSequence = inputBitSequence(1: (length(inputBitSequence) - length(bitSequence)));

res = outputBitSequence;
end