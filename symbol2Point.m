function point = symbol2Point( symbol, type )

if( strcmp(type, 'BPSK') == 1)
    if(symbol == 0)
        point = -1 + 0i;
    elseif(symbol == 1)
        point = 1 + 0i;
    end
end

if( strcmp(type, 'QPSK') == 1)
    if (symbol == [0 0]) point = -1 - 1i; end
    if (symbol == [0 1]) point = -1 + 1i; end
    if (symbol == [1 0]) point = 1 - 1i; end
    if (symbol == [1 1]) point = 1 + 1i; end
    point = point / sqrt(2);
end
if( strcmp(type, '16-QAM') == 1)
    r = 1;
    i = 1;
    if(symbol(1) == 0) r = -1 * r; end
    if(symbol(2) == 0) r = 3 * r; end
    if(symbol(3) == 0) i = -1 * i; end
    if(symbol(4) == 0) i = 3 * i; end 
    point = r + 1i * i;
    point = point / sqrt(10);
end
    
    
    
end

