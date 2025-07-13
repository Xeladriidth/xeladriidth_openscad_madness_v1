//@handle

function encapsulate(input_list,depth) =

encapsulate_v1(input_list,depth);

//@singulars

function encapsulate_v1(input_list,depth,depth_pointer,run_pointer,carry,input_list_len_cached) = 

assert(is_list(input_list))

  (
(is_undef(depth))
  )?

encapsulate_v1(input_list,1,1,run_pointer,carry,input_list_len_cached):

  (
(is_undef(depth_pointer))
  )?

encapsulate_v1(input_list,depth,1,run_pointer,carry,input_list_len_cached):

  (
(is_undef(run_pointer))||(is_undef(carry))
  )?

encapsulate_v1(input_list,depth,depth_pointer,0,[],input_list_len_cached):

  (
(is_undef(input_list_len_cached))
  )?

encapsulate_v1(input_list,depth,depth_pointer,run_pointer,carry,len(input_list)):

  (
(run_pointer>=input_list_len_cached)&&(depth_pointer>=depth)
  )?

carry:

  (
(run_pointer>=input_list_len_cached)&&(depth_pointer<depth)
  )?

encapsulate_v1(carry,depth,depth_pointer+1,0,[],input_list_len_cached):

  (
(run_pointer<input_list_len_cached)
  )?

encapsulate_v1(input_list,depth,depth_pointer,run_pointer+1,concat(carry,[[input_list[run_pointer]]]),input_list_len_cached):


assert(false,str("function definition overrun for function encapsulate with arguments ",input_list,depth,depth_pointer,run_pointer,carry,input_list_len_cached));

//@testers

test_list_1 = [ for(q=[0:1:9]) round(rands(0,99,1)[0]) ];

echo(encapsulate(test_list_1,5));

test_list_2 = [1];

echo(encapsulate(test_list_2,5));