function list_only_nums(input_data,pointer) = 

assert(is_list(input_data))

(
  (is_undef(pointer))
)?
    list_only_nums(input_data,0):

(
  (pointer>=len(input_data))
)?
    true:

(
  (pointer<len(input_data))
&&(!is_num(input_data[pointer]))
)?
    false:

(
  (pointer<len(input_data))
&&(is_num(input_data[pointer]))
)?
    list_only_nums(input_data,pointer+1):

assert(false,"function definition overrun for function list_only_nums");

test_list_1 = [for(q=[0:1:10]) q,"a"];

echo(test_list_1);

echo(list_only_nums(test_list_1));//unfinished
