function point = pointRound( noisedPoint, type )
if( strcmp(type, 'BPSK') == 1)
    if(noisedPoint > 0)
        point = 1;
    else
        point = -1;
    end    
end

if( strcmp(type, 'QPSK') == 1)
    point = (2 * round((noisedPoint * sqrt(2) + 1 + 1i) / 2) - 1 - 1i);
    
    r = real(point);
    if (r > 1)
        r = 1;
    elseif(r < -1)
        r = -1;
    end
    
    im = imag(point);
    if (im > 1)
        im = 1;
    elseif(im < -1)
        im = -1;
    end
point = (r + 1i * im) / sqrt(2);
end

if( strcmp(type, '16-QAM') == 1)
    point = (2 * round((noisedPoint * sqrt(10) + 3 + 3i) / 2) - 3 - 3i);
    
    r = real(point);
    if (r > 3)
        r = 3;
    elseif(r < -3)
        r = -3;
    end
    
    im = imag(point);
    if (im > 3)
        im = 3;
    elseif(im < -3)
        im = -3;
    end
point = (r + 1i * im) / sqrt(10);
end

if( strcmp(type, '64-QAM') == 1)
    point = (2 * round((noisedPoint * sqrt(42) + 7 + 7i) / 2) - 7 - 7i);
    
    r = real(point);
    if (r > 7)
        r = 7;
    elseif(r < -7)
        r = -7;
    end
    
    im = imag(point);
    if (im > 7)
        im = 7;
    elseif(im < -7)
        im = -7;
    end
point = (r + 1i * im) / sqrt(42);
end

end

