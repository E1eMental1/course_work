function noisedPoint = noise( point, p, K )
%����� ������� x = sqrt(p) * h * d + ksi

if( K == Inf )
   h = 1;
else
hr = randn / sqrt(2) + 1i * randn / sqrt(2);
h = (sqrt(K) + hr) /  sqrt(K + 1); %���������� �����
end

ksi = randn / sqrt(2) + 1i * randn / sqrt(2);

noisedPoint = point + ksi / ( h * sqrt(p));
end

