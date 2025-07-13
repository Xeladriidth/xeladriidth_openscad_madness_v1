//@handle

function string_search(input_string,searchant) = 

assert(is_string(input_string))

assert(is_string(searchant))

  (
input_string==""
  )?

"":

  (
searchant==""
  )?

undef:

string_search_v1(input_string,searchant);

//@singular

function string_search_v1(input_string,searchant,input_pointer,searchant_pointer,carry) = 

//initialise

  (
is_undef(input_pointer)||is_undef(carry)||is_undef(searchant_pointer)
  )?

string_search_v1(input_string,searchant,0,0,[]):

//end state

  (
input_pointer>=len(input_string)
  )?

carry:

  (
input_pointer<len(input_string)&&input_string[input_pointer+searchant_pointer]==searchant[searchant_pointer]&&searchant_pointer>=len(searchant)-1
  )?

string_search_v1(input_string,searchant,input_pointer+1,0,concat(carry,input_pointer)):

  (
input_pointer<len(input_string)&&input_string[input_pointer+searchant_pointer]!=searchant[searchant_pointer]
  )?

string_search_v1(input_string,searchant,input_pointer+1,0,carry):

  (
input_pointer<len(input_string)&&input_string[input_pointer+searchant_pointer]==searchant[searchant_pointer]&&searchant_pointer<len(searchant)-1
  )?

string_search_v1(input_string,searchant,input_pointer,searchant_pointer+1,carry):

assert(false,str("function definition overrun for function string_search_v1 with arguments input_string",  input_string  ,",   selector",  selector  ,",   input_pointer",  input_pointer  ,",   selector_pointer",  selector_pointer  ,",   carry",  carry  ));

function string_search_v2(input_string,searchant,input_pointer,searchant_pointer,carry,input_string_len_cached,searchant_len_cached) = 

//initialise

  (
is_undef(searchant_len_cached)
  )?

string_search_v2(input_string,searchant,input_pointer,searchant_pointer,carry,input_string_len_cached,len(searchant)):

  (
is_undef(input_string_len_cached)
  )?

string_search_v2(input_string,searchant,input_pointer,searchant_pointer,carry,len(input_string),searchant_len_cached):

  (
is_undef(input_pointer)||is_undef(carry)||is_undef(searchant_pointer)
  )?

string_search_v2(input_string,searchant,0,0,[]):

//end state

  (
input_pointer>=input_string_len_cached
  )?

carry:

  (
input_pointer<input_string_len_cached&&input_string[input_pointer+searchant_pointer]==searchant[searchant_pointer]&&searchant_pointer>=searchant_len_cached-1
  )?

string_search_v2(input_string,searchant,input_pointer+1,0,concat(carry,input_pointer)):

  (
input_pointer<input_string_len_cached&&input_string[input_pointer+searchant_pointer]!=searchant[searchant_pointer]
  )?

string_search_v2(input_string,searchant,input_pointer+1,0,carry):

  (
input_pointer<input_string_len_cached&&input_string[input_pointer+searchant_pointer]==searchant[searchant_pointer]&&searchant_pointer<searchant_len_cached-1
  )?

string_search_v2(input_string,searchant,input_pointer,searchant_pointer+1,carry):

assert(false,str("function definition overrun for function string_search_v1 with arguments input_string",  input_string  ,",   selector",  selector  ,",   input_pointer",  input_pointer  ,",   selector_pointer",  selector_pointer  ,",   carry",  carry  ));
/*
test_string_1 = "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddda";

echo(test_string_1);

echo(string_search(test_string_1,"a"));
*/