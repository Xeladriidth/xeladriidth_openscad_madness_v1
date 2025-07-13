//@handle

function list_select_first(input_list,selector) = 

assert(is_list(input_list))

assert(input_list!=[])

    assert(
(  is_undef(selector))||(
((len(input_list)>=selector)&&selector>=0)
  )
    )

list_select_first_v1(input_list,selector);

//@singulars

function list_select_first_v1(input_list,selector,pointer,carry) = 

  (
(is_undef(selector))
  )?

input_list[0]:

  (
(is_undef(pointer))||(is_undef(carry))
  )?

list_select_first_v1(input_list,selector,0,[]):

  (
(pointer>=selector)
  )?

carry:

  (
(pointer<selector)
  )?

list_select_first_v1(input_list,selector,pointer+1,concat(carry,input_list[pointer])):

assert(false,str("function definition overrun for function list_select_first with arguments ",input_list,selector,pointer,carry));

//@testers

list_select_first_tester_1 = [];

list_select_first_tester_2 = [ for(q=[0:10]) round(rands(0,99,1)[0]) ];

//echo(list_select_first(list_select_first_tester_1));

//echo(list_select_first(list_select_first_tester_2));

//echo(list_select_first(list_select_first_tester_2,5));

//echo(list_select_first(5));