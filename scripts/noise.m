function noisedPoint = noise( point, p )
%Общая формула x = sqrt(p) * h * d + ksi
h = randn / sqrt(2) + 1i * randn / sqrt(2);
ksi = randn / sqrt(2) + 1i * randn / sqrt(2);

noisedPoint = point + ksi / ( h * sqrt(p));
end

