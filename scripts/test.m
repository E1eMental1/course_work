sum = 0;
num = 100000;
for i = 1:num
    sum = sum + randn ^ 2 /2;
end
sum / num