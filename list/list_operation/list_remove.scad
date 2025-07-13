//@handle

function list_remove(input_list,removor) = 

assert(is_list(input_list))

assert(is_list(removor)||(is_num(removor)))

  (
(input_list==[]||removor==[])
  )?

[]:

list_remove_v2(input_list,removor);

//@singular


function list_remove_v2(input_list,removor,removor_pointer,list_pointer,carry,input_list_len_cached,removor_len_cached) =

  (
(is_undef(removor_len_cached))
  )?

list_remove_v2(input_list,removor,removor_pointer,list_pointer,carry,input_list_len_cached,len(removor)):

  (
(is_undef(input_list_len_cached))
  )?

list_remove_v2(input_list,removor,removor_pointer,list_pointer,carry,len(input_list),removor_len_cached):

  (
(is_undef(list_pointer)||is_undef(carry))
  )?

list_remove_v2(input_list,removor,removor_pointer,0,[],input_list_len_cached,removor_len_cached):

  (
(is_undef(removor_pointer))
  )?

list_remove_v2(input_list,removor,0,list_pointer,carry,input_list_len_cached,removor_len_cached):

  (
(removor_pointer>=removor_len_cached)
  )?

input_list:

  (
(removor_pointer<removor_len_cached&&list_pointer>=input_list_len_cached)
  )?

list_remove_v2(carry,removor,removor_pointer+1,0,[],input_list_len_cached-1,removor_len_cached):

  (
(removor_pointer<removor_len_cached&&list_pointer<input_list_len_cached&&removor[removor_pointer]==list_pointer)
  )?

list_remove_v2(input_list,removor,removor_pointer,list_pointer+1,carry,input_list_len_cached,removor_len_cached):

  (
(removor_pointer<removor_len_cached&&list_pointer<input_list_len_cached&&removor[removor_pointer]!=list_pointer)
  )?

list_remove_v2(input_list,removor,removor_pointer,list_pointer+1,concat(carry,input_list[list_pointer]),input_list_len_cached,removor_len_cached):

assert(false,str("function definition overrun for function list_remove_v2 with arguments ",input_list,removor,removor_pointer,list_pointer,carry));

function list_remove_v1(input_list,removor,removor_pointer,list_pointer,carry) =

  (
(is_undef(list_pointer)||is_undef(carry))
  )?

list_remove_v1(input_list,removor,removor_pointer,0,[]):

  (
(is_undef(removor_pointer))
  )?

list_remove_v1(input_list,removor,0,list_pointer,carry):

  (
(removor_pointer>=len(removor))
  )?

input_list:

  (
(removor_pointer<len(removor)&&list_pointer>=len(input_list))
  )?

list_remove_v1(carry,removor,removor_pointer+1,0,[]):

  (
(removor_pointer<len(removor)&&list_pointer<len(input_list)&&removor[removor_pointer]==list_pointer)
  )?

list_remove_v1(input_list,removor,removor_pointer,list_pointer+1,carry):

  (
(removor_pointer<len(removor)&&list_pointer<len(input_list)&&removor[removor_pointer]!=list_pointer)
  )?

list_remove_v1(input_list,removor,removor_pointer,list_pointer+1,concat(carry,input_list[list_pointer])):

assert(false,str("function definition overrun for function list_remove_v1 with arguments ",input_list,removor,removor_pointer,list_pointer,carry));

//@tester



list_remove_test_list_1 = [ for(q=[0:100]) round(rands(0,999,1)[0]) ];

echo(list_remove_test_list_1);

list_remove_tester_2 = [ for(q=[0:10]) round(rands(0,50,1)[0]) ];

echo(len(list_remove(list_remove_test_list_1,list_remove_tester_2)));

