//@handle

function alphabet_from_protobet(input_protobet) = 

assert(is_list(input_protobet)||is_string(input_protobet))

assert(len(input_protobet)>2)

alphabet_from_protobet_v1(input_protobet);

//@singulars

function alphabet_from_protobet(input_protobet,pointer,carry) =

  (
is_undef(pointer)||is_undef(carry)
  )?

alphabet_from_protobet(input_protobet,0,[]):

  (
pointer>=len(input_protobet)
  )?

carry:

  (
pointer<len(input_protobet)
  )?

alphabet_from_protobet(input_protobet,pointer+1,concat(carry,[[input_protobet[pointer],pointer]])):

assert(false,str("function definition overrun for function alphabet_from_protobet_v1 with arguments input_protobet",input_protobet,",   ,pointer",pointer,",   carry",carry));


string_from_num_protobet_v1 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

echo(alphabet_from_protobet(string_from_num_protobet_v1));