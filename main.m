%����� ������� x = sqrt(p) * h * d + ksi
counter = 0;
miss_counter = 0;

for i = 1:10000
%���� ��������� ���������� ��������, ���������� ���������� �������,
%����������� ���������� � ��������� ������� � �� ���������
h = 1;  %�������������� ������(�� ���� ������� ������ �������)

p = 4;  %�������� �������, � �� ��������� ����� �������� ������


ksi = createNoise();    %����������� ���(����������� � ����� 0, � ��������� 0,5

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
ans = miss_counter/counter


