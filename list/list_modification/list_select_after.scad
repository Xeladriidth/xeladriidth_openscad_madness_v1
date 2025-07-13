//@handle

function list_select_after(input_list,selector) = 

assert(is_list(input_list))

assert(is_num(selector))

  (
(selector==0)
  )?

input_list:

  (
(selector==len(input_list)-1)
  )?

input_list[len(input_list)-1]:

list_select_after_v1(input_list,selector);

//@singular

function list_select_after_v1(input_list,selector,pointer,carry,input_list_len_cached) = 

  (
(is_undef(input_list_len_cached))
  )?

list_select_after_v1(input_list,selector,pointer,carry,len(input_list)):

  (
(is_undef(pointer)||is_undef(carry))
  )?

list_select_after_v1(input_list,selector,selector,[],input_list_len_csched):

  (
(pointer>=input_list_len_cached)
  )?

carry:

  (
(pointer<input_list_len_cached)
  )?

list_select_after_v1(input_list,selector,pointer+1,concat(carry,input_list[pointer]),input_list_len_cached):

assert(false,str("function definition overrun for function list_select_after with arguments ",input_list,selector,pointer,carry,input_list_len_cached));