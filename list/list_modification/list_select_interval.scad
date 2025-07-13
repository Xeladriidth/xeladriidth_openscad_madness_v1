//@handle

function list_select_interval(input_list,selector) = 

assert(is_list(input_list))

assert(len(selector)==2) assert(is_num(selector[0])) assert(is_num(selector[1]))

assert(selector[1]>=selector[0])

  (
(input_list==[])
  )?

[]:

  (
(selector[0]==0)&&(selector[1]==len(input_list)-1)
  )?

input_list:

list_select_interval_v1(input_list,selector);

//@singulars

function list_select_interval_v1(input_list,selector,pointer,carry,input_list_len_cached) =

  (
(is_undef(input_list_len_cached))
  )?

list_select_interval_v1(input_list,selector,pointer,carry,len(input_list)):

  (
(is_undef(pointer)||(is_undef(carry)))
  )?

list_select_interval_v1(input_list,selector,selector[0],[],input_list_len_cached):

  (
(pointer>=selector[1]||pointer>=input_list_len_cached)
  )?

carry:

  (
(pointer<selector[1]&&pointer<input_list_len_cached)
  )?

list_select_interval_v1(input_list,selector,pointer+1,concat(carry,input_list[pointer]),input_list_len_cached):

assert(false,str("function definition overrun for function list_select_interval with arguments",input_list,selector,pointer,carry,input_list_len_cached));

//@testers

list_select_interval_tester_1 = [ for(q=[0:20]) round(rands(0,999,1)[0]) ];

//echo(list_select_interval_tester_1);

//for(q=[0:1:len(list_select_interval_tester_1)-1])

//echo(list_select_interval(list_select_interval_tester_1,[0,q]));