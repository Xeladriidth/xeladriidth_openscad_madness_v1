//@handle 

function string_replace(input,replacor) = 

  (
input==""
  )?

"":

  (
replacor==[]
  )?

"":

assert(is_string(input))

assert(is_list(replacor))

string_replace_v1(input,replacor);

//@singular

function string_replace_v1(input,insertor,input_pointer,insertor_pointer,carry) = 

// initialise

  (
is_undef(input_pointer)||is_undef(insertor_pointer)||is_undef(carry)
  )?

string_replace_v1(input,insertor,0,0,""):

  (
insertor_pointer>=len(insertor)
  )?

carry:

  (
insertor_pointer<len(insertor)&&(input_pointer==insertor[insertor_pointer] //have we reached the position on the input that is specified by the current insertor in focus?