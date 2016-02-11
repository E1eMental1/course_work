%Общая формула x = sqrt(p) * h * d + ksi

for ro = -10:0.5:15 %ro - ОСШ в дб
p = 0.5 * 10 ^ (0.1 * ro);  %Мощность сигнала, расчитываается из ОСШ а дб

counter = 0;
miss_counter = 0;%величины для определения вероятности

for i = 1:100000
%Блок генерации случайного симовола, нахождение принятного символа,
%определение ближайшего к принятому симовлу и их сравнение
h = 1;  %Характеристика канала(ее пока положим равной единице)


ksi = randn / sqrt(2) + 1i * randn / sqrt(2);    %комплексный шум(матожидания у обоих 0, а дисперсии 0,5

d = ((randi(4) - 1) * 2 - 3) + 1i * ((randi(4) - 1) * 2 - 3);%Генерация случайного символа(в комплексном виде) для 16-КАМ

obtained_d = d + ksi / ( h * sqrt(p));%После добавления шума получаем этот символ(в комплексном виде)

%Принимаем решение, какой это символ

hypothesis_d = 2 * round((obtained_d + 3 + 3i) / 2) - 3 - 3i;

r = real(hypothesis_d);
if (r > 3)
    r = 3;
elseif(r < -3)
    r = -3;
end

im = imag(hypothesis_d);
if (im > 3)
    im = 3;
elseif(im < -3)
    im = -3;
end

hypothesis_d = r + 1i * im;

%сравниваем
if (d ~= hypothesis_d)
    miss_counter = miss_counter + 1;
end

counter = counter + 1;

end

%добавляем в массив значения вероятности в зависимости от ОСШ
if (ro == -10)
    errplot = miss_counter/counter;
    roplot = ro;
end
errplot = [ errplot miss_counter/counter];
roplot = [roplot ro];


persent = (ro + 10) * 4%добавил для показа хода выполнения
end
plot(roplot, errplot)
