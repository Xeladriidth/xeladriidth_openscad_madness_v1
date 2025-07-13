//@handle

function string_select_interval(input_string,selector) = 

assert(is_string(input_string))

assert(len(selector)==2) assert(is_num(selector[0])) assert(is_num(selector[1]))

  (
input_string==""||selector[0]==selector[1]
  )?

"":

string_select_interval_v1(input_string,selector);

//@singular

function string_select_interval_v1(input_string,selector,pointer,carry,input_string_len_cached) =

  (
is_undef(input_string_len_cached)
  )?

string_select_interval_v1(input_string,selector,pointer,carry,len(input_string)):

  (
is_undef(pointer)||is_undef(carry)
  )?

string_select_interval_v1(input_string,selector,0,"",input_string_len_cached):

  (
pointer>=selector[1]||pointer>=input_string_len_cached
  )?

carry:

  (
pointer<selector[1]&&pointer>=selector[0]
  )?

string_select_interval_v1(input_string,selector,pointer+1,str(carry,input_string[pointer])):

  (
pointer<selector[1]&&pointer<selector[1]
  )?

string_select_interval_v1(input_string,selector,pointer+1,carry):

assert(false,str("function definition overrun for function string_select_interval with arguments input_string",  input_string  ,",   selector",  selector  ,",   pointer",  pointer  ,",   carry",  carry  ,",   input_string_len_cached",  input_string_len_cached  ));

//@tester

/*

string_select_interval_tester_1 = "bat8GJGh6uPlhamHAieY7evUUkVX7xUTAfSB2ytndGtDj8s2Hvo4r7OprGarag8MHxfTHAViYryo7BeowP1DaQV0sbG4xqLjMVyN";

for(a=[0:1:len(string_select_interval_tester_1)])

for(q=[0:1:len(string_select_interval_tester_1)]) 

echo(string_select_interval(string_select_interval_tester_1,[a,q]));

*/