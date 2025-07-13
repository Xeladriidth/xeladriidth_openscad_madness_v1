//@handler

function list_is_flat(input_list) = 

assert(is_list(input_list))

list_is_flat_v1(input_list);

//@singulars

function list_is_flat_v1(input_list,pointer,list_length_cached) = 

  (
(is_undef(pointer))||(is_undef(list_length_cached))
  )?

list_is_flat_v1(input_list,0,len(input_list)):

  (
(pointer>=list_length_cached)
  )?

true:

  (
(pointer<list_length_cached)&&(is_list(input_list[pointer]))
  )?

false:

  (
(pointer<list_length_cached)&&(!is_list(input_list[pointer]))
  )?

list_is_flat_v1(input_list,pointer+1,list_length_cached):

assert(false,str("function definition overrun for function list_is_flat_v1 with arguments ",input_list,pointer,list_length_cached));

//@tests

list_is_flat_test_list_1 = [ for (q=[0:1:9]) round(rands(0,9,1) [0]) ];

list_is_flat_test_list_2 = [ [0,1], for (q=[0:1:9]) round(rands(0,9,1) [0]) ];

list_is_flat_test_list_3 = [ "hallo", for (q=[0:1:9]) round(rands(0,9,1) [0]) ];

list_is_flat_test_list_4 = [ ["hallo","ahaha"], for (q=[0:1:9]) round(rands(0,9,1) [0]) ];

echo(list_is_flat(list_is_flat_test_list_1));

echo(list_is_flat(list_is_flat_test_list_2));

echo(list_is_flat(list_is_flat_test_list_3));

echo(list_is_flat(list_is_flat_test_list_4));