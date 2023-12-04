Program DKR3;
uses Crt;
type
  func = function(x: Real): Real;

function f(x: real): real;
begin
  f := 2 * x * x * x + 2 * x * x - 5 * x + 13;
end;

procedure left_method(a, b: Real; n: Integer; func: func; var s, pogr: real);
var
  h, x: Real;
  i: Integer;
  fa, fb: real; 
begin
  h := (b - a) / n;
  x := a;
  s := 0; 
  for i := 0 to n - 1 do begin
    s := s + func(x);
    x := x + h;
  end;
  s := s * h;
  fa := 1/2 * b * b * b * b + 2/3 * b * b * b - 5/2 * b * b + 13 * b; 
  fb := 1/2 * a * a * a * a + 2/3 * a * a * a - 5/2 * a * a + 13 * a; 
  pogr := fa - fb - s; 
end;

var
  a, b: Real;
  n: Integer;
  s, pogr: Real;
  Z: char;
begin
  repeat
    ClrScr;
    textcolor(Red);
    writeln('1. Вычисление площади фигуры');
    writeln('2. Выход');
    write('Выберите действие: '); 
    Z := ReadKey;
    case Z of
      '1':
      begin
        ClrScr;
        Textcolor(Red);
        writeln('Введите границы интегрирования: ');
        readln(a, b);
        Textcolor(Red);
        writeln('Введите количество разделений: ');
        readln(n);
        left_method(a, b, n, f, s, pogr);
        Textcolor(Yellow);
        writeln('Площадь фигуры: ', s);
        Textcolor(Yellow);
        writeln('Погрешность: ', pogr);
        readln;
      end;
      '2': halt;
    end;
    // Reset text color to default
    Textcolor(White);
  until Z = '2';
end.

