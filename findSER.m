function SER = findSER( v1, v2, type)

cv1 = v1;
cv2 = v2;
counter = 0;
missCounter = 0;

[symbol1, cv1] = fetchSymbol(cv1, type);
[symbol2, cv2] = fetchSymbol(cv2, type);
while(symbol1 ~=-1)
    if(symbol1 ~= symbol2)
        missCounter = missCounter + 1;
    end
    counter = counter + 1;
    [symbol1, cv1] = fetchSymbol(cv1, type);
    [symbol2, cv2] = fetchSymbol(cv2, type);
end
SER = missCounter / counter;


end

