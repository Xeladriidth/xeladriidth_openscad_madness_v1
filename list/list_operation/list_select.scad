//@handle

function list_select(input_list,selector) = 

assert(is_list(input_list))

  (
(input_list==[]||selector==[])
  )?

[]:

  (
(is_num(selector))
  )?

input_list[selector]:

list_select_v1(input_list,selector);

//@singulars

function list_select_v1(input_list,selector,selector_pointer,list_pointer,carry,input_list_len_cached,selector_len_cached) =

  (
(is_undef(selector_len_cached))
  )?

list_select_v1(input_list,selector,selector_pointer,list_pointer,carry,input_list_len_cached,len(selector)):

  (
(is_undef(input_list_len_cached))
  )?

list_select_v1(input_list,selector,selector_pointer,list_pointer,carry,len(input_list),selector_len_cached):

  (
(is_undef(list_pointer)||is_undef(carry))
  )?

list_select_v1(input_list,selector,selector_pointer,0,[],input_list_len_cached,selector_len_cached):

  (
(is_undef(selector_pointer))
  )?

list_select_v1(input_list,selector,0,list_pointer,carry,input_list_len_cached,selector_len_cached):

  (
(selector_pointer>=selector_len_cached)
  )?

carry:

  (
(selector_pointer<selector_len_cached)&&(list_pointer>=input_list_len_cached)
  )?

assert(false,str("data set overrun for funtion list_select_v1 with arguments ",input_list,selector,selector_pointer,list_pointer,carry,input_list_len_cached,selector_len_cached)):

  (
(selector_pointer<selector_len_cached)&&(list_pointer<input_list_len_cached)&&(list_pointer==selector[selector_pointer])
  )?

list_select_v1(input_list,selector,selector_pointer+1,0,concat(carry,input_list[list_pointer]),input_list_len_cached,selector_len_cached):

  (
(selector_pointer<selector_len_cached)&&(list_pointer<input_list_len_cached)&&(list_pointer!=selector[selector_pointer])
  )?

list_select_v1(input_list,selector,selector_pointer,list_pointer+1,carry,input_list_len_cached,selector_len_cached):

assert(false,str("function definition overrun for function list_select_v1 with arguments ",input_list,selector,selector_pointer,list_pointer,carry,input_list_len_cached,selector_len_cached));

//@tester

/*

list_select_test_1 = [for(q=[0:99]) round(rands(0,99,1)[0])];

list_select_test_2 = [for(q=[0:10]) round(rands(0,100,1)[0])];

echo(list_select(list_select_test_1,[]));

echo(list_select(list_select_test_1,list_select_test_2));

echo(len(list_select(list_select_test_1,list_select_test_2)));

*/