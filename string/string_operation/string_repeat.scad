//@handle

function string_repeat(input_string,pointer,carry) =

assert(is_string(input_string))

assert(len(input_string)==pointer+len(carry)-1)

  (
input_string==""
  )?

"":

  (
pointer==0
  )?

input_string:

  (
pointer>=len(input_string)
  )?

carry:

string_repeat_v1(input_string,pointer,carry);

function string_repeat_v1(input_string,pointer,carry,input_string_len_cached) = 

  (
is_undef(input_string)
  )?

string_repeat_v1(input_string,pointer,carry,len(input_string)):

  (
pointer>=input_string_len_cached
  )?

carry:

  (
pointer<input_string_len_cached
  )?

string_repeat_v1(input_string,pointer+1,str(carry,input_string[pointer])):

assert(false,str("function definition overrun for function string_select_interval with arguments input_string",  input_string  ,",   pointer",  pointer  ,",   carry",  carry  ,"
,   input_string_len_cached",  input_string_len_cached  ));