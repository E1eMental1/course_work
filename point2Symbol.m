function symbol = point2Symbol( point, type )
if( strcmp(type, 'BPSK') == 1)
    if(point == -1 + 0i)
        symbol = 0;
    elseif(point == 1 + 0i)
        symbol = 1;
    end
end

if( strcmp(type, 'QPSK') == 1)
    if(point == -1 - 1i) symbol = [0 0]; end
    if(point == -1 + 1i) symbol = [0 1]; end
    if(point == 1 - 1i) symbol = [1 0]; end
    if(point == 1 + 1i) symbol = [1 1]; end
end

if( strcmp(type, '16-QAM') == 1)
    r = real(point);
    i = imag(point);
    if(r < 0) a1 = 0; else a1 = 1; end
    if(abs(r) == 3) a2 = 0; else a2 = 1; end
    if(i < 0) a3 = 0; else a3 = 1; end
    if(abs(i) == 3) a4 = 0; else a4 = 1; end
    symbol = [a1 a2 a3 a4];
end
end

