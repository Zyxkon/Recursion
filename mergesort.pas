program mergesort;
uses crt;
var 
    arr: array of integer = (3, 2, 1, 7, 6, 9, 8, 4, 5, 10, 25, 84, 44, 75);
    i: integer;
procedure merge(var input_array: array of integer; l: integer; m: integer; r: integer);
    var
        i: integer;
        j: integer;
        k: integer;
        n1: integer;
        n2: integer;
        left_array: array of integer;
        right_array: array of integer;
    begin
        n1 := m - l + 1;
        n2 := r - m;
        setlength(left_array, n1);
        setlength(right_array, n2);
        for i:=0 to n1 do 
            left_array[i] := 0;
        for j:=0 to n2 do
            right_array[j] := 0;
        for i:=0 to n1 do
            left_array[i] := input_array[l + i];
        for j:=0 to n2 do
            right_array[j] := input_array[m + 1 + j];
        i := 0;    
        j := 0;    
        k := l;  
        while ((i < n1) and (j < n2)) do
            begin
                if left_array[i] <= right_array[j] then
                    begin
                        input_array[k] := left_array[i];
                        i += 1;
                    end
                else 
                    begin
                        input_array[k] := right_array[j];
                        j += 1;
                    end;
                k += 1;
            end;
        while i < n1 do
            begin
                input_array[k] := left_array[i];
                i += 1;
                k += 1;
            end;
        while j < n2 do
            begin
                input_array[k] := right_array[j];
                j += 1;
                k += 1;
            end;
    end;
procedure mergeSort(var input_array: array of integer; l: integer; r: integer);
    var 
        m: integer;
    begin
        if l < r then
            begin
                m := l+round((r-l)/2);
                mergeSort(input_array, l, m);
                mergeSort(input_array, m+1, r);
                merge(input_array, l, m, r);
            end;
    end;
begin
    writeln('Before being sorted:');
    for i:=0 to length(arr)-1 do write(' ', arr[i]);
    mergeSort(arr, 0, length(arr)-1);
    writeln();
    writeln('After being sorted:');
    for i:=0 to length(arr)-1 do write(' ', arr[i]);
end.
