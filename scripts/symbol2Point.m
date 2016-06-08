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
if( strcmp(type, '64-QAM') == 1)
    cr = 4*symbol(1) + 2*symbol(2) + symbol(3);
    switch cr
        case 0
            r = -7;
        case 1
            r = -5;
        case 2
            r = -1;
        case 3
            r = -3;
        case 4
            r = 7;
        case 5
            r = 5;
        case 6
            r = 1;
        case 7
            r = 3;
        otherwise
            disp('other value')
    end
    ci = 4*symbol(4) + 2*symbol(5) + symbol(6);
    switch ci
        case 0
            i = -7;
        case 1
            i = -5;
        case 2
            i = -1;
        case 3
            i = -3;
        case 4
            i = 7;
        case 5
            i = 5;
        case 6
            i = 1;
        case 7
            i = 3;
        otherwise
            disp('other value')
    end
    point = r + 1i * i;
    point = point / sqrt(42);
end
    
end

