function list_remove_by_index(target_list,projectile,index,carry) =

assert(is_list(target_list))

(
  (projectile==undef)
)?
    target_list:



(
  (!is_list(projectile))
&&(index==undef)
&&(carry==undef)
&&(!is_list(projectile))
)?
    list_remove_by_index(target_list,projectile,0,[]):

(
  (!is_list(index))
&&(index>=len(target_list))
)?
    carry:

(
  (!is_list(index))
&&(index<len(target_list))
&&(index==projectile)
)?
    list_remove_by_index(target_list,projectile,index+1,carry):

(
  (!is_list(index))
&&(index<len(target_list))
&&(index!=projectile)
)?
    list_remove_by_index(target_list,projectile,index+1,
        concat(carry,
            [target_list[index]]
        )
    ):

(
  (is_list(projectile))
&&(index==undef)
&&(carry==undef)
)?
    list_remove_by_index(target_list,projectile,[0,0],[]):

(
  (is_list(projectile))
&&(is_list(index))
&&(index>=len(projectile))
)?
    carry:

(
  (is_list(projectile))
&&(is_list(index))
&&(index<len(projectile))
)
    list_remove_by_index(target

//we will write a new helper function for this


assert(false,"function definition overrun in function list_remove_by_index");

test_list_1 = [ for(q=[0:1:10]) q ];

echo(test_list_1);

echo(list_remove_by_index(test_list_1,1));