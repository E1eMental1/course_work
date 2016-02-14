function noisedPoint = noise( point )
%Общая формула x = sqrt(p) * h * d + ksi
p = 1;
h = 1;
ksi = randn / sqrt(2) + 1i * randn / sqrt(2);

noisedPoint = point + ksi / ( h * sqrt(p));
end

