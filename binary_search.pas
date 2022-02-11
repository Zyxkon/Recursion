unit binary_search;
interface
function binarysearch(var input_array: array of integer; starting: integer; ending: integer; key: integer): integer;
implementation
function binarysearch(var input_array: array of integer; starting: integer; ending: integer; key: integer): integer;
    var
        middle: integer;
    begin
        middle := round((starting+ending)/2);
        if ending >= starting then
            begin
                if input_array[middle] = key then
                    binarysearch := middle;
                if input_array[middle] > key then
                    binarysearch := binarysearch(input_array, starting, middle-1, key);
                if input_array[middle] < key then
                    binarysearch := binarysearch(input_array, middle+1, ending, key);
            end
        else
            binarysearch := 0;
    end;
end.
