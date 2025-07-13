//@handle

function string_select_after(input_string,selector,pointer,carry) = 

assert(is_string(input_string))

assert(is_num(selector))

  (
input_string==""
  )?

"":

  (
selector==0
  )?

input_string:

  (
selector==len(input_string)-1
  )?

"":

string_select_after_v1(input_string,selector);

//@singulars

function string_select_after_v1(input_string,selector,pointer,carry,input_string_len_cached) =

  (
is_undef(input_string_len_cached)
  )?

string_select_after_v1(input_string,selector,pointer,carry,len(input_string)):

  (
is_undef(carry)||is_undef(pointer)
  )?

string_select_after_v1(input_string,selector,0,"",input_string_len_cached):

  (
pointer>=input_string_len_cached
  )?

carry:

  (
pointer<input_string_len_cached&&pointer>=selector
  )?

string_select_after_v1(input_string,selector,pointer+1,str(carry,input_string[pointer]),input_string_len_cached):

  (
pointer<input_string_len_cached&&pointer<selector
  )?

string_select_after_v1(input_string,selector,pointer+1,carry,input_string_len_cached):

assert(false,str("function definition overrun for function string_select_interval with arguments input_string",  input_string  ,",   selector",  selector  ,",   pointer",  pointer  ,",   carry",  carry  ,",   input_string_len_cached",  input_string_len_cached  ));

