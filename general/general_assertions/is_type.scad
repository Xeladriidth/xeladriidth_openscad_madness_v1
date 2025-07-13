//@includes

//@handle

function is_type(input,test_type) = 

assert(!is_undef(input))

assert(!is_undef(test_type))

false;

//@singulars

function is_type_v1(input,test_type) = 

  (
(test_type=="string")
  )?

is_string(input):

  (
(test_type=="num")
  )?

is_num(input):

  (
(test_type=="list")
  )?

is_list(input):

  (
(test_type=="matrix")
  )?

is_matrix(input):

  (
(test_type=="hashtable")
  )?

is_hashtable(input):

  (
(test_type=="tuple")
  )?

is_tuple(input):

assert(false,"function definition overrun for function is_type_v1");

//@tests