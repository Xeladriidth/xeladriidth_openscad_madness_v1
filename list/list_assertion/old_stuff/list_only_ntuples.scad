include <master_connector.scad>

function list_only_ntuples(input_data,n,pointer) = 

assert(is_list(input_data))

(
  (
    (!is_num(n))
  ||(is_undef(n))
    )
&&(is_array(input_data))
)?
    list_only_ntuples(input_data,len(input_data[0]),pointer):

(
  (!is_num(n))
&&(!is_array(input_data))
&&(is_list(input_data))
)?
    assert(false,"unrecognized data format for n in function list_only_ntuples"):

(
  is_undef(pointer)
)?
    list_only_ntuples(input_data,n,0):

(
  (pointer>=len(input_data))
)?
    true:

(
  (!is_list(input_data[0]))
||(!is_list(input_data[pointer]))
)?
    false:

(
  (pointer<len(input_data))
&&(is_list(input_data[0]))
&&(is_list(input_data[pointer]))
&&(len(input_data[0])!=len(input_data[pointer]))
)?
    false:

(
  (pointer<len(input_data))
&&(is_list(input_data[0]))
&&(is_list(input_data[pointer]))
&&(len(input_data[0])==len(input_data[pointer]))
)?
    list_only_ntuples(input_data,n,pointer+1):

assert(false,"function definition overrun for function list_only_ntuples");

test_list_1 = [for(q=[0:1:10]) [q,q]];

echo(test_list_1);

echo(list_only_ntuples(test_list_1));//unfinished
