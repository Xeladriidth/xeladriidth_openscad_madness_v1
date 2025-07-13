//@handle 

function list_random(length,sample,weights) = 

assert(is_num(length))

  (
!is_undef(sample)&&!is_undef(weights)
  )?

assert(len(sample)==len(weights)):

  (
length==0
  )?

[]:

  (
sample==[]
  )?

[]:

list_rsndom_v1(length,sample,weights);

//@helper

function list_random_helper_sum(input_list,pointer,carry) = 

assert(is_list(input_list))

  (
is_undef(pointer)||is_undef(carry)
  )?

list_random_helper_sum(input_list,0,0):

assert(is_num(input_list[pointer]))

  (
pointer>=len(input_list)
  )?

carry:

  (
pointer<len(input_list)
  )?

list_random_helper_sum(input_list,pointer+1,carry+input_list