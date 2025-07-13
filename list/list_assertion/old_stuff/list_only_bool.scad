include <master_connector.scad>

function list_only_bool(input_list,pointer) = 

assert(list_is_flat(input_list))

(
  (ndef(pointer))
)?
    list_only_bool(input_list,0):

(
  (pointer>=len(input_list))
)?
    true:

(
  (pointer<len(input_list))
&&(!is_bool(input_list[pointer]))
)?
    false:

(
  (pointer<len(input_list))
&&(is_bool(input_list[pointer]))
)?
    list_only_bool(input_list,inc(pointer)):

assert(false);

test_list_1 = [

for(q=[0:1:10]) true,false];

echo(test_list_1);

echo(list_only_bool(test_list_1));//unfinished
