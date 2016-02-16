n = 10000;
type = 'QPSK';


roplot = zeros(0);  %��� ���������� �������
BERplot_QPSK = zeros(0);%
SERplot_QPSK = zeros(0);%

if( strcmp(type, 'BPSK') == 1)
    symbolLength = 1;
end
if( strcmp(type, 'QPSK') == 1)
    symbolLength = 2;
end
if( strcmp(type, '16-QAM') == 1)
    symbolLength = 4;
end

romin = -10;
romax = 20;
for ro = romin:0.4:romax %ro - ��� � ��
    p = 0.5 * 10 ^ (0.1 * ro);
    BERcounter = 0;
    missBERcounter = 0;
    SERcounter = 0;
    missSERcounter = 0;
    for i = 1:n
        symbol = randi(2, [1 symbolLength]) - 1;
        point = symbol2Point( symbol, type );
        noisedPoint = noise(point, p);%���������� ����
        roundedPoint = pointRound(noisedPoint, type);%����������� ��������� �����
        obtainedSymbol = point2Symbol(roundedPoint, type);%��������� ������
        
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
    BERplot_QPSK = [BERplot_QPSK BER];
    SERplot_QPSK = [SERplot_QPSK SER];
end
semilogy(roplot, BERplot_QPSK, roplot, SERplot_QPSK);
grid on;
