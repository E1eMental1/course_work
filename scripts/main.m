n = 100000;
type = 'QPSK';
Kdb = -50;
K = 10 ^ (0.1 * Kdb);

roplot = zeros(0);  %для построения графика
BERplot_QPSK = zeros(0);%
SERplot_QPSK = zeros(0);%


romin = -10;
romax = 20;
for ro = romin:0.4:romax %ro - ОСШ в дб
p = 10 ^ (0.1 * ro);

inputSeq = creatingInputBitSequence(n);

[outputSeq, resizedInputSeq] = creatingReceivedBitSequence(inputSeq, type, p, K);

BER = findBER(resizedInputSeq, outputSeq);

roplot = [roplot ro]
BERplot_QPSK = [BERplot_QPSK BER];

SER = findSER(resizedInputSeq, outputSeq, type);
SERplot_QPSK = [SERplot_QPSK SER];

end
semilogy(roplot, BERplot_QPSK, roplot, SERplot_QPSK);
grid on;