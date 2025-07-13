//@handle

function string_select_first(input_string,selector) = 

assert(is_string(input_string))

  (
(input_string=="")
  )?

"":

assert(is_num(selector))

  (
(selector==len(input_string)-1)
  )?

input_string:

string_select_first_v1(input_string,selector);

//@singulars

function string_select_first_v1(input_string,selector,pointer,carry,input_string_len_cached) = 

  (
(is_undef(input_string_len_cached))
  )?

string_select_first_v1(input_string,selector,pointer,carry,len(input_string)):

  (
(is_undef(pointer)||is_undef(carry))
  )?

string_select_first_v1(input_string,selector,0,"",input_string_len_cached):

  (
(pointer>=selector||pointer>=input_string_len_cached)
  )?

carry:

  (
(pointer<selector)
  )?

string_select_first_v1(input_string,selector,pointer+1,str(carry,input_string[pointer]),input_string_len_cached):

assert(false,str("function definition overrun for function string_select_first_v1 with arguments ",input_string,selector,pointer,carry,input_string_len_cached));

//@tester

/*

string_select_tester_1 = "eMkundefMrQzPundeflAundefxkcLeaDEeoRpundefmyetbllYqN3JEundefundefZvnuEZkfHnundefundefKhH8OZ2y4HR8b8kcfwLEpecbPundef5vQjAnbOy4cpVNlGs3hoJ";

for(q=[0:1:len(string_select_tester_1)]) echo(string_select_first(string_select_tester_1,q));

*/