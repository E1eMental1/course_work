% N0=4;
% A=1;
% fd = 1000;
% dt = 66.7E-6;
% lp = zeros(0);
% hp = zeros(0);
% teta = 2*pi * rand(1, N0);
% 
% for l = 1:3000
%     
%     h = 0;
%     for j = 1:N0
%         h = h + sqrt(2 /N0) * A * exp(1i * pi * j / N0) * cos(2*pi * fd * l * dt * cos(2*pi * (j-0.5) / (4 * N0)) + teta(j));
%     end
%     
%     lp = [lp (l * dt)];
%     hp = [hp (10 * log10( abs(h) ) )];
%     disp(l);
% end
% plot(lp, hp);
% xlabel('t, c');
% ylabel('|h|, db');
% axis([0 0.18 -20 5])

romin = -10;
romax = 25;

roplot = romin:0.4:romax;
p = 10 .^ (0.1 .* roplot);
BPSK = Q1(sqrt(2*p));
QPSK = Q1(sqrt(p));
QAM16 = 3/4 * Q1( sqrt(p/5)) + 1/2 * Q1(3*sqrt(p/5)) - 1/4 * Q1(5*sqrt(p/5));
QAM64 = 7/12 * Q1(1*sqrt(p/21)) + 1/2 * Q1(3*sqrt(p/21)) - 1/12 * Q1(5*sqrt(p/21)) +1/12 * Q1(9*sqrt(p/21)) - 1/12 * Q1(13*sqrt(p/21));

