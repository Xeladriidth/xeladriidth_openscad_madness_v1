function list_contains_num(input_list,index) = 

assert(is_list(input_list))

(
  (is_undef(index))
)?
    list_contains_num(input_list,0):

(
  (is_num(input_list[index]))
)?
    true:

(
  (index>=len(input_list))
&&(!is_list(input_list[index]))
)?
    false:

(
  (index<len(input_list))
&&(!is_list(input_list[index]))
)?
    list_contains_num(input_list,index+1):

assert(false,"function definition overrun for assertion list_contains_num");
//unfinished
