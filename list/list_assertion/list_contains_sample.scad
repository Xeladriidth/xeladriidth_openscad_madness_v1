//@handle

function list_contains_sample(input_list,sample) = 

assert(is_list(input_list))

  (
(input_list==[])
  )?

false:

  (
(sample==[])
  )?

true:

list_contains_sample_v1(input_list,sample);

//@singular

function list_contains_sample_v1(input_list,sample,pointer,input_list_len_cached) = 

  (
is_undef(input_list_len_cached)
  )?

list_contains_sample_v1(input_list,sample,pointer,len(input_list)):

  (
is_undef(pointer)
  )?

list_contains_sample_v1(input_list,sample,0,input_list_len_cached):

  (
(pointer>=input_list_len_cached)
  )?

false:

  (
(pointer<input_list_len_cached)&&(input_list[pointer]==sample)
  )?

true:

  (
(pointer<input_list_len_cached)&&(input_list[pointer]!=sample)
  )?

list_contains_sample_v1(input_list,sample,pointer+1,input_list_len_cached):

assert(false,str("function definition overrun for function list_contains_sample_v1 with arguments ",input_list,sample,pointer,input_list_len_cached));

//@tester

/*

list_contains_sample_tester_1 = [1];

list_contains_sample_tester_2 = [];

list_contains_sample_tester_3 = "";

list_contains_sample_tester_4 = [for(q=[0:10000]) 1,0];

echo(list_contains_sample_tester_4);

//echo(list_contains_sample(list_contains_sample_tester_1,0));

//echo(list_contains_sample(list_contains_sample_tester_1,1));

//echo(list_contains_sample(list_contains_sample_tester_2,[1]));

echo(list_contains_sample(list_contains_sample_tester_4,0));

*/