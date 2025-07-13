//@handle

function list_select_last(input_list,selector) = 

assert(is_list(input_list))

assert((is_undef(selector))||(selector>=0))

  (
([]==input_list)
  )?

[]:

  (
(is_undef(selector))
  )?

input_list[len(input_list)-1]:

list_select_last_v1(input_list,selector);

//@singulars

function list_select_last_v1(input_list,selector,pointer,carry,input_list_len_cached) =

  (
(is_undef(pointer))||(is_undef(carry))
  )?

list_select_last_v1(input_list,selector,len(input_list)-2,[input_list[len(input_list)-1]],len(input_list)):

  (
(pointer<=input_list_len_cached-selector)
  )?

carry:

  (
(pointer>input_list_len_cached-selector)
  )?

list_select_last_v1(input_list,selector,pointer-1,concat(carry,input_list[pointer])):

assert(false,str("function definition overrun for function list_select_last_v1 with arguments ",input_list,selector,pointer,carry,input_list_len_cached));

list_select_last_test_list_1 = [for(q=[0:10]) round(rands(0,999,1)[0]) ];

echo(list_select_last_test_list_1);

echo(list_select_last(list_select_last_test_list_1));

echo(list_select_last([]));

