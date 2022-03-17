program quicksort;
uses crt;
var
    arra: array[0..9] of Integer = (8, 5, 2, 3, 9, 0, 7, 4, 6, 1);
procedure exchange(var arr: array of Integer; i: Integer; j: Integer);
var
    temp: Integer;
begin
  temp := arr[i];
  arr[i] := arr[j];
  arr[j] := temp;
end;
function partition(var arr: array of Integer; low: Integer; high: Integer) : Integer;
var
    pivot, i, j: Integer;
begin
  pivot := arr[high];
  i := low - 1;
  for j := low to high do
  begin
    if (arr[j] < pivot) then
    begin
      i := i + 1;
      exchange(arr, i, j);
    end;
  end;
  exchange(arr, i+1, high);
  partition:=i+1;
end;
procedure qsort(var arr: array of Integer; low: Integer; high: Integer);
var
    pivot: Integer;
begin
  if (high > low) then
  begin
    pivot := partition(arr, low, high);
    qsort(arr, low, pivot-1);
    qsort(arr, pivot+1, high);
  end;
end;
procedure print_array(arr: array of Integer);
var
    i: Integer;
begin
  for i:=0 to Length(arr)-1 do
  begin
    Write(arr[i], ' ');
  end;
  writeln();
end;
begin
  WriteLn('hi');
  print_array(arra);
  qsort(arra, 0, Length(arra)-1);
  print_array(arra);
  ReadLn;
end.
