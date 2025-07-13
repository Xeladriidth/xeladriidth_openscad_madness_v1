//@inclusion

include <the new library/general/assertions/is_type.scad>

//@handler

function list_only_type(input_list,test_type) = 

false;

//@singulars

function list_only_type_v1(input_list,test_type,pointer,input_list_length_cached) = 

  (
(is_undef(pointer))||(is_undef(input_list_length_cached))
  )?

list_only_type_v1(input_list,test_type,0,len(input_list)):

  (
(pointer>=input_list_length_cached)
  )?

true:

  (
(pointer<input_list_length_cached)&&(!is_type(input_list[pointer],test_type))
  )?

false:

  (
(pointer<input_list_length_cached)&&(is_type(input_list[pointer],test_type))
  )?

list_only_type_v1(input_list,test_type,pointer+1,input_list_length_cached):

assert(false,"function definition overrun for function list_only_type_v1");

//@tests
