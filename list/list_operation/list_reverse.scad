//@handle

function list_reverse(input_list) = 

list_reverse_v1(input_list);

//@singulars

function list_reverse_v1(input_list,pointer,carry,input_list_len_cached) = 

assert(is_list(input_list))

  (
(is_undef(pointer))||(is_undef(carry))
  )?

list_reverse_v1(input_list,0,[],input_list_len_cached):

  (
(is_undef(input_list_len_cached))
  )?

list_reverse_v1(input_list,pointer,carry,len(input_list)):

  (
(pointer>=input_list_len_cached)
  )?

carry:

  (
(pointer<input_list_len_cached)
  )?

list_reverse_v1(input_list,pointer+1,concat(carry,[input_list[input_list_len_cached-pointer]])):

assert(false,str("function definition overrun for function list_reverse_v1 with arguments ",input_list,pointer,carry,input_list_len_cached));


//@test

list_reverse_test_list_v1 = [ for(q=[0:1:127]) round(rands(0,99,1)[0]) ];

//for(q=[0:1:len(list_reverse_test_list_v1)]) echo(list_reverse(list_reverse_test_list_v1)[q]==list_reverse_test_list_v1[len(list_reverse_test_list_v1)-q]);