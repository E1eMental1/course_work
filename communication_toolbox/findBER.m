function BER = findBER( numberOfSymbols,  modulationType, ModulationOrder, encode, snr, Kfactor )
BER = zeros(0);

for ro = snr
    p = 10 ^ (0.1 * ro);
    [ data, receivedData ] = transferData(numberOfSymbols, modulationType, ModulationOrder, encode, p, Kfactor );
    BER = [BER sum(abs(receivedData - data))/length(data)];
    disp(ro);
end

end

