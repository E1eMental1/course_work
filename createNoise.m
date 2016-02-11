function noise = createNoise()
k1 = randn / sqrt(2);
k2 = randn / sqrt(2);
noise = k1 + 1i * k2;