function BER = findBER( v1, v2 )
BER = sum(abs(v1 - v2)) / length(v1);
end

