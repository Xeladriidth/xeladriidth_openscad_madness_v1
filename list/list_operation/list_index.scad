//@handle

function list_index(input_list,searchant) = 

list_index_v1(input_list,searchant);

//@singulars

function list_index_v1(input_list,searchant,pointer,carry,input_list_len_cached) = 

assert(is_list(input_list))

assert(!is_undef(searchant))

  (
(is_undef(pointer))||(is_undef(carry))
  )?

list_index_v1(input_list,searchant,0,[],input_list_len_cached):

  (
(is_undef(input_list_len_cached))
  )?

list_index_v1(input_list,searchant,pointer,carry,len(input_list)):

  (
(pointer>=input_list_len_cached)
  )?

carry:

  (
(pointer<input_list_len_cached)&&(input_list[pointer]==searchant)
  )?

list_index_v1(input_list,searchant,pointer+1,concat(carry,pointer),input_list_len_cached):

  (
(pointer<input_list_len_cached)&&(input_list[pointer]!=searchant)
  )?

list_index_v1(input_list,searchant,pointer+1,carry,input_list_len_cached):

assert(false,str("function definition overrun for function list_index_v1 with arguments ",input_list,searchant,pointer,carry,input_list_len_cached));

//@tester

list_index_tester_1 = [for(q=[0:10]) round(rands(0,1,1)[0]) ];

//echo(list_index(list_index_tester_1,0));