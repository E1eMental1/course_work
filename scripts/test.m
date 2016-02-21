rplot = 10 .^ (0.1 .* roplot);
tBPSK = (1 - sqrt(rplot ./ (rplot + 1))) ./ 2; 
tQPSK = (1 - sqrt(0.5 .* rplot ./ (0.5 .* rplot + 1))) ./ 2; 

semilogy(roplot, tBPSK, roplot, BERplot_BPSK, '*', roplot, tQPSK, roplot, BERplot_QPSK, '*');
axis([-10 35 (10 ^ -3) 1])
grid on