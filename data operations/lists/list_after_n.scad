include <master_connector.scad>

function list_after_n(input_data,n) = 

    list_last_n(input_data,len(input_data) - n);
