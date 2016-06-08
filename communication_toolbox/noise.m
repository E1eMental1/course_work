function [ receivedSignal ] = noise( Signal, snr, Kfactor )

%аддитивный шум
ksi = randn(length(Signal), 1) / sqrt(2) + 1i * randn(length(Signal), 1) / sqrt(2); 

%Мультипликативный шум
if( Kfactor == Inf )            %аддитивный шум                                                
   h = ones(length(Signal), 1);
elseif(Kfactor == -1)           %Модель Кларка
    N0=4;
    fd = 1000;
    dt = 66.7E-6;
    
    l = 1:length(Signal);
    l = l';
    l = l(:,ones(1,N0));
    
    n = 1:N0;
    n = n(ones(1,length(Signal)),:);
    
    A = ones(N0, 1);
    
    teta = 2 * pi * rand(1, N0);
    teta = teta(ones(1,length(Signal)),:);
    
    f1 = 2 * pi* fd * dt * l .* cos(2 * pi / ( 4 * N0) * (n - 0.5) );
    f2 = cos(f1 + teta) .* exp(1i * pi / N0 * n);
    
    h = sqrt(2 / N0) * f2 * A;
    
else                            %райсовский канал
    hri = randn(length(Signal), 1) / sqrt(2) + 1i * randn(length(Signal), 1) / sqrt(2);
    K = sqrt(Kfactor) * ones(length(Signal), 1);
    h = (K + hri) ./  sqrt(Kfactor + 1);
end
    
receivedSignal = Signal + ksi ./ ( h * sqrt(snr) );

end

