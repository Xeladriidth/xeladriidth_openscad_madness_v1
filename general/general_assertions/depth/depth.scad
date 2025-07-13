//@handle

//@singulars

function depth_v0(input_object,carry) = 



  (
(is_undef(carry))
  )?

depth_v0(input_object,0):

  (
(!is_list(input_object))
  )?

carry:

  (
(len(input_object)>1)
  )?

assert(false,"multi element lists not yet implemented"):

  (
(is_list(input_object))
  )?

depth_v0(input_object[0],carry+1):

assert(false,str("function definition overrun for function depth with arguments ",input_object,carry));

//@testers

depth_tester_1 = [[[[[[83]]]]], [[[[[76]]]]], [[[[[34]]]]], [[[[[86]]]]], [[[[[14]]]]], [[[[[72]]]]], [[[[[39]]]]], [[[[[86]]]]], [[[[[49]]]]], [[[[[49]]]]]];


depth_tester_2 = depth_tester_1[0];

echo(depth_v0(depth_tester_1));


//echo(depth_tester_2);