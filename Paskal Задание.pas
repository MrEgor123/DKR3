program DKR3;

var
  a, b: real;

function Func(x: real): real;
begin
  Func := 2 * x * x * x + 2 * x * x - 5 * x + 13;
end;

function left_method(a, b: real; n: integer): real;
var
  h, x, sum: real;
  i: integer;
begin
  h := (b - a) / n;
  sum := 0;
  x := a;

  for i := 1 to n do
  begin
    sum := sum + Func(x);
    x := x + h;
  end;

  left_method := h * sum;
end;

function pogr(a, b: real; n: integer): real;
var
  h: real;
begin
  h := (b - a) / n;
  pogr := (h * h * h / 24) * (b - a);
end;

procedure case_menu;
var
  k, n: integer;
  result, error: real;
begin
  repeat
    writeln('Дейтсвие 1: Введите пределы интегрирования');
    writeln('Действие 2: Вычислить определенный интеграл');
    writeln('Действие 3: Выход');
    readln(k);

    case k of
      1: // первое действие 
      begin
        write('Введите начальный предел: ');
        readln(a);
        write('Введите конечный предел: ');
        readln(b);
      end;
      2: // второе действие
      begin
        write('Введите количество разбиений: ');
        readln(n);

        result := left_method(a, b, n);
        error := pogr(a, b, n);

        writeln('Результат вычисления: ', result:0:6);
        writeln('Оценка погрешности: ', error:0:6);
      end;
    end;

  until k = 3; // третье действие (выход)
end;

begin
  case_menu;
end.
