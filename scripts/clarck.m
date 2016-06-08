function [roplot, BERplot] = clarck( type, K, maxl )
global teta;


roplot = zeros(0);  %для построения графика
BERplot = zeros(0);%
SERplot = zeros(0);%

if( strcmp(type, 'BPSK') == 1)
    symbolLength = 1;
end
if( strcmp(type, 'QPSK') == 1)
    symbolLength = 2;
end
if( strcmp(type, '16-QAM') == 1)
    symbolLength = 4;
end
if( strcmp(type, '64-QAM') == 1)
    symbolLength = 6;
end

romin = -10;
romax = 40;
for ro = romin:0.8:romax %ro - ОСШ в дб
    p = 10 ^ (0.1 * ro);
    teta = -1;
    
    BERcounter = 0;
    missBERcounter = 0;
    SERcounter = 0;
    missSERcounter = 0;
    
    for l = 1:maxl
        symbol = randi(2, [1 symbolLength]) - 1;
        point = symbol2Point( symbol, type );
        noisedPoint = noise(point, p, K, l);%Добавление шума
        roundedPoint = pointRound(noisedPoint, type);%определение ближайшей точки
        obtainedSymbol = point2Symbol(roundedPoint, type);%Полученый символ
        
        missBERcounter = missBERcounter + sum(abs(symbol - obtainedSymbol));
        BERcounter = BERcounter + symbolLength;
        
        if(roundedPoint ~= point)
            missSERcounter = missSERcounter + 1;
        end
        SERcounter = SERcounter + 1;
    end
    BER = missBERcounter / BERcounter;
    SER = missSERcounter / SERcounter;
    
    ro
    roplot = [roplot ro];
    BERplot = [BERplot BER];
    SERplot = [SERplot SER];
end
semilogy(roplot, BERplot, roplot, SERplot);
grid on;

end
%[roplot, BERplotm1] = clarck('QPSK', -1, 20000)
%[roplot, BERplot] = clarck('QPSK', 0, 20000)