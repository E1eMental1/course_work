%����� ������� x = sqrt(p) * h * d + ksi

for ro = -10:0.5:15 %ro - ��� � ��
p = 0.5 * 10 ^ (0.1 * ro);  %�������� �������, �������������� �� ��� � ��

counter = 0;
miss_counter = 0;%�������� ��� ����������� �����������

for i = 1:100000
%���� ��������� ���������� ��������, ���������� ���������� �������,
%����������� ���������� � ��������� ������� � �� ���������
h = 1;  %�������������� ������(�� ���� ������� ������ �������)


ksi = randn / sqrt(2) + 1i * randn / sqrt(2);    %����������� ���(����������� � ����� 0, � ��������� 0,5

d = ((randi(4) - 1) * 2 - 3) + 1i * ((randi(4) - 1) * 2 - 3);%��������� ���������� �������(� ����������� ����) ��� 16-���

obtained_d = d + ksi / ( h * sqrt(p));%����� ���������� ���� �������� ���� ������(� ����������� ����)

%��������� �������, ����� ��� ������

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

%����������
if (d ~= hypothesis_d)
    miss_counter = miss_counter + 1;
end

counter = counter + 1;

end

%��������� � ������ �������� ����������� � ����������� �� ���
if (ro == -10)
    errplot = miss_counter/counter;
    roplot = ro;
end
errplot = [ errplot miss_counter/counter];
roplot = [roplot ro];


persent = (ro + 10) * 4%������� ��� ������ ���� ����������
end
plot(roplot, errplot)
