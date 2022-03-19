unit quicksort;
interface
type
    IntArray = array of Integer;
procedure qsort(var arr: array of Integer; low: Integer; high: Integer);
procedure print_array(arr: array of Integer);
function contains(arr: array of Integer; element: Integer):Boolean;
function randomize_array(var arr: array of Integer) : IntArray;
implementation
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
function contains(arr: array of Integer; element: Integer):Boolean;

    var
        i: Integer;
    begin
    for i in arr do
    begin
        if i = element then 
        begin
            contains:=True;
            Exit;       
        end;
    end;
    contains:=False;
    end;    
function randomize_array(var arr: array of Integer) : IntArray;
    var
        i, randint: Integer;
        found: array of Integer;
        randommed: array of Integer;
    begin
        randomize;
        SetLength(randommed, 0);
        SetLength(found, 0);
        while (Length(randommed) < Length(arr)) do 
        begin
        randint := arr[random(Length(arr))];
        if not quicksort.contains(found, randint) then
            begin
                Insert(randint, found, Length(found));
                Insert(randint, randommed, Length(randommed));
            end;
        end;    
        randomize_array := randommed;
    end;

end.
