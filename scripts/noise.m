function noisedPoint = noise( point, p, K, l )
%����� ������� x = sqrt(p) * h * d + ksi
N0=4;
A=1;
fd = 100;
dt = 66.7E-6;
%k=-1 ������ ������
%k=Inf ������� ������� �����
%k=0 ���������� �����

global teta;

if(teta == -1)  
    teta = 2*pi * rand(1, N0);
end

if( K == Inf )                                                           %����������������� ���
   h = 1;
elseif(K == -1)
    h = 0;
    for j = 1:N0
        h = h + sqrt(2 /N0) * A * exp(1i * pi * j / N0) * cos(2*pi * fd * l * dt * cos(2*pi * (j-0.5) / (4 * N0)) + teta(j));
    end
else
    hr = randn / sqrt(2) + 1i * randn / sqrt(2);
    h = (sqrt(K) + hr) /  sqrt(K + 1); %���������� �����
end

ksi = randn / sqrt(2) + 1i * randn / sqrt(2); %���������� ���

noisedPoint = point + ksi / ( h * sqrt(p));
end

