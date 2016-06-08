romin = -10;
romax = 25;

roplot = romin:0.4:romax;
p = 10 .^ (0.1 .* roplot);
BPSK = Q1(sqrt(2*p));
QPSK = Q1(sqrt(p));
QAM16 = 3/4 * Q1( sqrt(p/5)) + 1/2 * Q1(3*sqrt(p/5)) - 1/4 * Q1(5*sqrt(p/5));
QAM64 = 7/12 * Q1(1*sqrt(p/21)) + 1/2 * Q1(3*sqrt(p/21)) - 1/12 * Q1(5*sqrt(p/21)) +1/12 * Q1(9*sqrt(p/21)) - 1/12 * Q1(13*sqrt(p/21));
