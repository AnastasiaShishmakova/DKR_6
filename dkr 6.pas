const
  MAX_SIZE = 10; // Максимальный размер дека

type
  TDeque = record
    data: array[0..MAX_SIZE-1] of Integer;
    front, rear, count: Integer;
  end;

var
  deque: TDeque;
  choice, value: Integer;

// Инициализация дека
procedure InitDeque(var d: TDeque);
begin
  d.front := 0;
  d.rear := 0;
  d.count := 0;
end;

// Проверка на пустоту
function IsEmpty(d: TDeque): Boolean;
begin
  IsEmpty := (d.count = 0);
end;

// Проверка на заполненность
function IsFull(d: TDeque): Boolean;
begin
  IsFull := (d.count = MAX_SIZE);
end;

// Добавление в начало
procedure PushFront(var d: TDeque; val: Integer);
begin
  if IsFull(d) then
  begin
    writeln('Дек переполнен!');
    exit;
  end;
  
  d.front := (d.front - 1 + MAX_SIZE) mod MAX_SIZE;
  d.data[d.front] := val;
  d.count := d.count + 1;
end;

// Добавление в конец
procedure PushBack(var d: TDeque; val: Integer);
begin
  if IsFull(d) then
  begin
    writeln('Дек переполнен!');
    exit;
  end;
  
  d.data[d.rear] := val;
  d.rear := (d.rear + 1) mod MAX_SIZE;
  d.count := d.count + 1;
end;

// Удаление из начала
procedure PopFront(var d: TDeque);
begin
  if IsEmpty(d) then
  begin
    writeln('Дек пуст!');
    exit;
  end;
  
  d.front := (d.front + 1) mod MAX_SIZE;
  d.count := d.count - 1;
end;

// Удаление из конца
procedure PopBack(var d: TDeque);
begin
  if IsEmpty(d) then
  begin
    writeln('Дек пуст!');
    exit;
  end;
  
  d.rear := (d.rear - 1 + MAX_SIZE) mod MAX_SIZE;
  d.count := d.count - 1;
end;

// Визуализация дека
procedure DisplayDeque(d: TDeque);
var
  i, index: Integer;
begin
  if IsEmpty(d) then
  begin
    writeln('Дек пуст!');
    exit;
  end;

  writeln('Содержимое дека:');
  write('[ ');
  
  for i := 0 to d.count - 1 do
  begin
    index := (d.front + i) mod MAX_SIZE;
    write(d.data[index], ' ');
  end;
  
  writeln(']');
end;

begin
  InitDeque(deque);
  
  repeat
    writeln;
    writeln('Меню:');
    writeln('1. Добавить в начало');
    writeln('2. Добавить в конец');
    writeln('3. Удалить из начала');
    writeln('4. Удалить из конца');
    writeln('5. Показать дек');
    writeln('6. Выход');
    write('Выберите действие: ');
    readln(choice);
    
    case choice of
      1: begin
           write('Введите значение: ');
           readln(value);
           PushFront(deque, value);
         end;
      2: begin
           write('Введите значение: ');
           readln(value);
           PushBack(deque, value);
         end;
      3: PopFront(deque);
      4: PopBack(deque);
      5: DisplayDeque(deque);
      6: writeln('Выход...');
      else writeln('Неверный выбор!');
    end;
  until choice = 6;
end.