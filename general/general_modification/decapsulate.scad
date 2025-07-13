//@handle

function decapsulate(input_list,depth) =

decapsulate_v1(input_list,depth);

//@singulars

function decapsulate_v1(input_list,depth,depth_pointer,run_pointer,carry,input_list_len_cached) = 

assert(is_list(input_list))

  (
(is_undef(depth))
  )?

decapsulate_v1(input_list,1,1,run_pointer,carry,input_list_len_cached):

  (
(is_undef(depth_pointer))
  )?

decapsulate_v1(input_list,depth,1,run_pointer,carry,input_list_len_cached):

  (
(is_undef(run_pointer))||(is_undef(carry))
  )?

decapsulate_v1(input_list,depth,depth_pointer,0,[],input_list_len_cached):

  (
(is_undef(input_list_len_cached))
  )?

decapsulate_v1(input_list,depth,depth_pointer,run_pointer,carry,len(input_list)):

  (
(run_pointer>=input_list_len_cached)&&(depth_pointer>=depth)
  )?

carry:

  (
(run_pointer>=input_list_len_cached)&&(depth_pointer<depth)
  )?

decapsulate_v1(carry,depth,depth_pointer+1,0,[],input_list_len_cached):

  (
(run_pointer<input_list_len_cached)
  )?

decapsulate_v1(input_list,depth,depth_pointer,run_pointer+1,concat(carry,input_list[run_pointer]),input_list_len_cached):


assert(false,str("function definition overrun for function decapsulate with arguments ",input_list,depth,depth_pointer,run_pointer,carry,input_list_len_cached));

//@testers

test_list_1 = [[[[[[83]]]]], [[[[[76]]]]], [[[[[34]]]]], [[[[[86]]]]], [[[[[14]]]]], [[[[[72]]]]], [[[[[39]]]]], [[[[[86]]]]], [[[[[49]]]]], [[[[[49]]]]]];

echo(decapsulate(test_list_1));

test_list_2 = [[[[[1]]]]];

echo(decapsulate(test_list_2));