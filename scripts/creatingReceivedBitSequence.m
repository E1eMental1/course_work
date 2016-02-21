function [res, resizedInputBitSequence] = creatingReceivedBitSequence(inputBitSequence, type, p, K)

outputBitSequence = zeros(0);
bitSequence = inputBitSequence;

[symbol, bitSequence] = fetchSymbol(bitSequence, type);
while(symbol ~= -1)
    point = symbol2Point( symbol, type );%��������� ����� �� �������
    noisedPoint = noise(point, p, K);%���������� ����
    roundedPoint = pointRound(noisedPoint, type);%����������� ��������� �����
    obtainedSymbol = point2Symbol(roundedPoint, type);%��������� ������
    
    outputBitSequence = [outputBitSequence obtainedSymbol];
    
    [symbol, bitSequence] = fetchSymbol(bitSequence, type);
end
resizedInputBitSequence = inputBitSequence(1: (length(inputBitSequence) - length(bitSequence)));

res = outputBitSequence;
end