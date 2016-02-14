function symbol = point2Symbol( point, type )
if( strcmp(type, 'BPSK') == 1)
    if(point == -1 + 0i)
        symbol = 0;
    elseif(point == 1 + 0i)
        symbol = 1;
    end
end

end

