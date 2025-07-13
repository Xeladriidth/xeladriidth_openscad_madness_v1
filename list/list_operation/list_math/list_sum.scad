//@handle

function list_sum(input_list,offset) = 

assert(is_list(input_list))

assert(is_undef(offset)||is_num(offset))

  (
input_list==[]
  )?

[]:

list_sum_v1(input_list,offset);

//@singular

function list_sum_v1(input_list,offset,pointer,carry,input_list_len_cached) = 

  (
is_undef(input_list_len_cached)
  )?

list_sum_v1(input_list,offset,pointer,carry,len(input_list)):

  (
is_undef(offset)
  )?

list_sum_v1(input_list,0,pointer,carry,input_list_len_cached):

assert(is_num(input_list[pointer]))

  (
pointer>=input_list_len_cached
  )?

carry+offset*input_list_len_cached:

  (
pointer<input_list_len_cached
  )?

list_sum_v1(input_list,offset,pointer+1,carry+input_list[pointer],input_list_len_cached):

assert(false,str("function definition overrun for function string_select_interval with arguments input_list",  input_list  ,",   offset",  offset  ,",   pointer",  pointer  ,",   carry",  carry  ,",   input_list_len_cached",  input_list_len_cached  ));