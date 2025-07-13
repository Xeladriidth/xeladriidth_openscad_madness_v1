function list_only_strings(input_data,pointer) = 

assert(!is_undef(input_data))

(
  (is_num(input_data))
)?
    false:

(
  (!is_list(input_data))
&&(is_string(input_data))
)?
    true:

(
  (!is_list(input_data))
&&(!is_string(input_data))
)?
    false:

(
  (is_undef(pointer))
)?
    list_only_strings(input_data,0):

(
  (pointer>=len(input_data))
)?
    true:

(
  (pointer<len(input_data))
&&(is_string(input_data[pointer]))
||(list_only_strings(input_data[pointer]))
)?
    list_only_strings(input_data,pointer+1):

(
  (pointer<len(input_data))
&&(is_num(input_data[pointer]))
)?
    false:

(
  (pointer<len(input_data))
&&(!is_string(input_data[pointer]))
)?
    false:

assert(false,"function definition overrun for function list_only_strings");//unfinished
