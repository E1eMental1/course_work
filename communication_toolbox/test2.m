snr = -10:0.8:40;
numberOfSymbols = 100000;
K = -1;

BPSK = findBER( numberOfSymbols,  'BPSK', 16, false, snr, K );
QPSK = findBER( numberOfSymbols,  'QPSK', 16, false, snr, K );
QAM16 = findBER( numberOfSymbols,  'QAM', 16, false, snr, K );
QAM64 = findBER( numberOfSymbols,  'QAM', 64, false, snr, K );

BPSKe = findBER( numberOfSymbols,  'BPSK', 16, true, snr, K );
QPSKe = findBER( numberOfSymbols,  'QPSK', 16, true, snr, K );
QAM16e = findBER( numberOfSymbols,  'QAM', 16, true, snr, K );
QAM64e = findBER( numberOfSymbols,  'QAM', 64, true, snr, K );

semilogy(snr, BPSK);
hold on;
semilogy(snr, QPSK);
semilogy(snr, QAM16);
semilogy(snr, QAM64);

semilogy(snr, BPSKe, 'r--', 'LineWidth', 2);
semilogy(snr, QPSKe, 'r--', 'LineWidth', 2);
semilogy(snr, QAM16e, 'r--', 'LineWidth', 2);
semilogy(snr, QAM64e, 'r--', 'LineWidth', 2);

axis([min(snr), max(snr), 10E-4, 1]);
grid on;