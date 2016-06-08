function y = Q1( x )
%гауссовский канал
y = (1 - erf(x ./ sqrt(2) ) ) ./ 2;
end

