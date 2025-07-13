//@singular

function list_replace(input_list,replacor) = 

assert(is_list(input_list))

assert(is_list(replacor))

  (
(input_list==[]||replacor==[])
  )?

[]:

list_replace_v2(input_list,replacor);

//@singular

function list_replace_v2(input_list,replacor,replacor_pointer,list_pointer,carry,replacor_len_cached,input_list_len_cached) = 

  (
is_undef(input_list_len_cached)
  )?

list_replace_v2(input_list,replacor,replacor_pointer,list_pointer,carry,replacor_len_cached,len(input_list)):

  (
is_undef(replacor_len_cached)
  )?

list_replace_v2(input_list,replacor,replacor_pointer,list_pointer,carry,len(replacor),input_list_len_cached):

  (
(is_undef(carry)||is_undef(list_pointer))
  )?

list_replace_v2(input_list,replacor,replacor_pointer,0,[],replacor_len_cached,input_list_len_cached):

  (
is_undef(replacor_pointer)
  )?

list_replace_v2(input_list,replacor,0,list_pointer,carry,replacor_len_cached,input_list_len_cached):

  (
replacor_pointer>=len(replacor)
  )?

input_list:

  (
replacor_pointer<len(replacor)&&list_pointer>=len(input_list)
  )?

list_replace_v2(carry,replacor,replacor_pointer+1,0,[],replacor_len_cached,input_list_len_cached):

  (
replacor_pointer<len(replacor)&&list_pointer<len(input_list)&&list_pointer==replacor[replacor_pointer][0]
  )?

list_replace_v2(input_list,replacor,replacor_pointer,list_pointer+1,concat(carry,replacor[replacor_pointer][1]),replacor_len_cached,input_list_len_cached):

  (
replacor_pointer<len(replacor)&&list_pointer<len(input_list)&&list_pointer!=replacor[replacor_pointer][0]
  )?

list_replace_v2(input_list,replacor,replacor_pointer,list_pointer+1,concat(carry,input_list[list_pointer]),replacor_len_cached,input_list_len_cached):

assert(false,str("function definition overrun for function list_replace_v2 with arguments input_list: ",input_list,"  replacor:",replacor,"  list_pointer:",list_pointer,"  carry:",carry));

function list_replace_v1(input_list,replacor,replacor_pointer,list_pointer,carry) = 

  (
(is_undef(carry)||is_undef(list_pointer))
  )?

list_replace_v1(input_list,replacor,replacor_pointer,0,[]):

  (
is_undef(replacor_pointer)
  )?

list_replace_v1(input_list,replacor,0,list_pointer,carry):

  (
replacor_pointer>=len(replacor)
  )?

input_list:

  (
replacor_pointer<len(replacor)&&list_pointer>=len(input_list)
  )?

list_replace_v1(carry,replacor,replacor_pointer+1,0,[]):

  (
replacor_pointer<len(replacor)&&list_pointer<len(input_list)&&list_pointer==replacor[replacor_pointer][0]
  )?

list_replace_v1(input_list,replacor,replacor_pointer,list_pointer+1,concat(carry,replacor[replacor_pointer][1])):

  (
replacor_pointer<len(replacor)&&list_pointer<len(input_list)&&list_pointer!=replacor[replacor_pointer][0]
  )?

list_replace_v1(input_list,replacor,replacor_pointer,list_pointer+1,concat(carry,input_list[list_pointer])):

assert(false,str("function definition overrun for function list_replace_v1 with arguments input_list: ",input_list,"  replacor:",replacor,"  list_pointer:",list_pointer,"  carry:",carry));

//@tester



list_replace_tester_1 = [ for(q=[0:100]) round(rands(0,999,1)[0]) ];

list_replace_tester_2 = [ [0,"no"], for(q=[0:10]) [round(rands(0,100,1)[0]),"hi"]];

echo(list_replace_tester_1);

echo(list_replace_tester_2);

echo(list_replace(list_replace_tester_1,list_replace_tester_2));

