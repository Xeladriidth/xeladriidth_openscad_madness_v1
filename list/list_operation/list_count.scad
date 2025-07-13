//@handle

function list_count(input_list,searchant) = 

assert(is_list(input_list))

assert(!is_undef(searchant))

  (
(input_list==[])
  )?

0:

list_count_v1(input_list,searchant);

//@singulars

function list_count_v1(input_list,searchant,pointer,carry,input_list_len_cached) =

  (
(is_undef(input_list_len_cached))
  )?

list_count_v1(input_list,searchant,pointer,carry,len(input_list)):

  (
(is_undef(pointer)||is_undef(carry))
  )?

list_count_v1(input_list,searchant,0,0,input_list_len_cached):

  (
(pointer>=input_list_len_cached)
  )?

carry:

  (
(pointer<input_list_len_cached&&input_list[pointer]==searchant)
  )?

list_count_v1(input_list,searchant,pointer+1,carry+1,input_list_len_cached):

  (
(pointer<input_list_len_cached&&input_list[pointer]!=searchant)
  )?

list_count_v1(input_list,searchant,pointer+1,carry,input_list_len_cached):

assert(false,str("function definition overrun for function list_count_v1 with arguments ",input_list,searchant,pointer,carry,input_list_len_cached));

//@tester

list_count_tester_1 = [for(q=[0:1:10]) round(rands(0,1,1)[0]) ];

//echo(list_count_v1(list_count_tester_1,1)+list_count_v1(list_count_tester_1,0));