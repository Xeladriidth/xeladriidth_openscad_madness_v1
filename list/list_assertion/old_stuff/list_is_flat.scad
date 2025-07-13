use <master_connector.scad>

list_is_flat = "

";

function list_is_flat(input_data,pointer) = 

assert(is_list(input_data))

(
  (is_undef(pointer))
)?
    list_is_flat(input_data,0):

(
  (pointer>=len(input_data))
)?
    true:

(
  (pointer>=len(input_data))
&&(is_list(input_data[len(input_data)-1]))
)?
    false:

(
  (pointer<len(input_data))
&&(is_list(input_data[pointer]))
)?
    false:

(
  (!is_undef(pointer))
&&(pointer<len(input_data))
&&(!is_list(input_data[pointer]))
)?
    list_is_flat(input_data,pointer+1):




assert(false,"function definition overrun for function list_is_flat");

/*

test_list_1 = [for(q=[0:1:10])q];

test_array_1 =[[2,2],[2,2]];

echo(test_list_1);

echo(list_is_flat(test_list_1));

*/

echo(list_is_flat(test_array_1));//unfinished
