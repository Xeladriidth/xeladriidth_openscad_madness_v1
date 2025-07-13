//@handle

function list_insert(input_list,insertor) = 

assert(is_list(input_list)) assert(is_list(insertor))

  (
input_list==[]||insertor==[]
  )?

[]:

list_insert_v1(input_list,insertor);

//@singular

function list_insert_v1(input_list,insertor,insertor_pointer,list_pointer,carry) =

  (
is_undef(carry)||is_undef(list_pointer)
  )?

list_insert_v1(input_list,insertor,insertor_pointer,0,[]):

  (
is_undef(insertor_pointer)
  )?

list_insert_v1(input_list,insertor,0,list_pointer,carry):

  (
insertor_pointer>=len(insertor)
  )?

input_list:

  (
insertor_pointer<len(insertor)&&list_pointer>=len(input_list)
  )?

list_insert_v1(carry,insertor,insertor_pointer+1,0,[]):

  (
insertor_pointer<len(insertor)&&list_pointer<len(input_list)&&list_pointer==insertor[insertor_pointer][0]
  )?

list_insert_v1(input_list,insertor,insertor_pointer,list_pointer+1,concat(carry,insertor[insertor_pointer][1],input_list[list_pointer])):

  (
insertor_pointer<len(insertor)&&list_pointer<len(input_list)&&list_pointer!=insertor[insertor_pointer][0]
  )?

list_insert_v1(input_list,insertor,insertor_pointer,list_pointer+1,concat(carry,input_list[list_pointer])):

assert(false,str("function definition overrun for function list_insert_v1 with arguments input_list:",input_list,",   insertor",insertor,",   insertor_pointer",insertor_pointer,",   list_pointer",list_pointer,",   carry",carry));

//@tester

/*

list_insert_tester_1 = [ for(q=[0:100]) round(rands(0,999,1)[0]) ];

list_insert_tester_2 = [ for(q=[0:10]) [round(rands(0,100,1)[0]), 99999 ] ];

echo(list_insert(list_insert_tester_1,list_insert_tester_2));

*/