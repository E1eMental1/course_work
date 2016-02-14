function point = symbol2Point( symbol, type )

if( strcmp(type, 'BPSK') == 1)
    if(symbol == 0)
        point = -1 + 0i;
    elseif(symbol == 1)
        point = 1 + 0i;
    end
end
end

