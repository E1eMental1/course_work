function [ data, dataDec ] = transferData( numberOfSymbols, modulationType, ModulationOrder, encode, snr, Kfactor )


if( strcmp(modulationType, 'BPSK') == 1)
    modulator = comm.BPSKModulator;
    demodulator = comm.BPSKDemodulator;
    symbolLength = 1;
end
if( strcmp(modulationType, 'QPSK') == 1)
    modulator = comm.QPSKModulator('BitInput', true);
    demodulator = comm.QPSKDemodulator('BitOutput', true);
    symbolLength = 2;
end
if( strcmp(modulationType, 'QAM') == 1)
    modulator = comm.RectangularQAMModulator('ModulationOrder', ModulationOrder, ...
        'BitInput', true, 'NormalizationMethod', 'Average power');
    demodulator = comm.RectangularQAMDemodulator('ModulationOrder',ModulationOrder, ...
        'BitOutput', true, 'NormalizationMethod', 'Average power');
    symbolLength = log2(ModulationOrder);
end

data = randi( [0 1], numberOfSymbols * symbolLength, 1 );

if(encode)
    trellis = poly2trellis(7, [ 133 171 ]);
    tbl = 1;
    dataEnc = convenc(data,trellis);
else
    dataEnc = data;
end

modSignal = step(modulator, dataEnc);


receivedSignal = noise(modSignal, snr, Kfactor);


receivedData = step(demodulator, receivedSignal);

if(encode)
    dataDec = vitdec(receivedData, trellis, tbl, 'cont', 'hard');
    data = data(1:end-tbl);
    dataDec = dataDec(tbl+1:end);
else
    dataDec = receivedData;
end




end

