//@handle 

function list_repeat(input_list,pointer,carry) = 

assert(is_list(input_list))

assert(is_undef(pointer)||is_num(pointer))

assert(is_undef(carry)||is_list(carry))

  (
input_list==[]
  )?

[]:

list_repeat_v2(input_list,pointer,carry);

//@singular

function list_repeat_v2(input_list,pointer,carry,input_list_len_cached,carry_len_cached) = 

  (
is_undef(carry_len_cached)
  )?

list_repeat_v2(input_list,pointer,carry,input_list_len_cached,len(carry)):

  (
is_undef(input_list_len_cached)
  )?

list_repeat_v2(input_list,pointer,carry,len(input_list),carry_len_cached):

  (
is_undef(pointer)&&(!is_undef(carry))
  )?

list_repeat_v2(input_list,len(input_list)-len(carry)-1,carry):

  (
is_undef(pointer)&&(is_undef(carry))
  )?

list_repeat_v2(input_list,0,[]):

  (
pointer>=len(input_list)
  )?

carry:

  (
pointer<len(input_list)
  )?

list_repeat_v2(input_list,pointer+1,concat(carry,input_list[pointer])):

assert(false,str("function definition overrun for function list_repeat_v2 with arguments input_list",input_list,",   pointer",pointer,",   ,carry",carry));

function list_repeat_v1(input_list,pointer,carry) = 

  (
is_undef(pointer)&&(!is_undef(carry))
  )?

list_repeat_v1(input_list,len(input_list)-len(carry)-1,carry):

  (
is_undef(pointer)&&(is_undef(carry))
  )?

list_repeat_v1(input_list,0,[]):

  (
pointer>=len(input_list)
  )?

carry:

  (
pointer<len(input_list)
  )?

list_repeat_v1(input_list,pointer+1,concat(carry,input_list[pointer])):

assert(false,str("function definition overrun for function list_repeat_v1 with arguments input_list",input_list,",   pointer",pointer,",   ,carry",carry));