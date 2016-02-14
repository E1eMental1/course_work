function point = pointRound( noisedPoint, type )
if( strcmp(type, 'BPSK') == 1)
    if(noisedPoint > 0)
        point = 1;
    else
        point = -1;
    end    
end


end

