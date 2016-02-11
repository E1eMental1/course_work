%Общая формула x = sqrt(p) * h * d + ksi
counter = 0;
miss_counter = 0;

for i = 1:10000
%Блок генерации случайного симовола, нахождение принятного символа,
%определение ближайшего к принятому симовлу и их сравнение
h = 1;  %Характеристика канала(ее пока положим равной единице)

p = 4;  %Мощность сигнала, и ее вероятнее всего придется менять


ksi = createNoise();    %комплексный шум(матожидания у обоих 0, а дисперсии 0,5

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
ans = miss_counter/counter


