//@data

//@generator data

string_from_num_protobet_v1 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

string_from_num_alphabet_v1 = [["0", 0], ["1", 1], ["2", 2], ["3", 3], ["4", 4], ["5", 5], ["6", 6], ["7", 7], ["8", 8], ["9", 9], ["a", 10], ["b", 11], ["c", 12], ["d", 13], ["e", 14], ["f", 15], ["g", 16], ["h", 17], ["i", 18], ["j", 19], ["k", 20], ["l", 21], ["m", 22], ["n", 23], ["o", 24], ["p", 25], ["q", 26], ["r", 27], ["s", 28], ["t", 29], ["u", 30], ["v", 31], ["w", 32], ["x", 33], ["y", 34], ["z", 35], ["A", 36], ["B", 37], ["C", 38], ["D", 39], ["E", 40], ["F", 41], ["G", 42], ["H", 43], ["I", 44], ["J", 45], ["K", 46], ["L", 47], ["M", 48], ["N", 49], ["O", 50], ["P", 51], ["Q", 52], ["R", 53], ["S", 54], ["T", 55], ["U", 56], ["V", 57], ["W", 58], ["X", 59], ["Y", 60], ["Z", 61]];

//@handle

function string_random(length,range,vers) = 

assert(is_num(length))

assert(is_undef(range)||is_num(range)||is_list(range))

assert(range!=0)

  (
(length==0)||(range==0)
  )?

"":

  (
is_list(range)
  )?

assert(len(range)==2&&is_num(range[0])&&is_num(range[1])):

string_random_v1(length,range,vers);

//singular

function string_random_v1(length,range,vers,pointer,carry) = 

  (
is_undef(pointer)||is_undef(carry)
  )?

string_random_v1(length,range,vers,0,""):

  (
is_undef(vers)
  )?

string_random_v1(length,range,1,pointer,carry):

  (
pointer>=length
  )?

carry:

  (
pointer<length&&is_undef(range)
  )?

string_random_v1(length,range,vers,pointer+1,str(carry,string_from_num_alphabet_v1[round(rands(0,len(string_from_num_alphabet_v1)-1,1)[0])][0])):

  (
pointer<length&&vers==1&&is_num(range)&&range>0
  )?

string_random_v1(length,range,vers,pointer+1,str(carry,
    string_from_num_alphabet_v1[round(rands(0,range,1)[0])][0]
    )
  ):

  (
pointer<length&&vers==1&&is_num(range)&&range<0
  )?

string_random_v1(length,range,vers,pointer+1,str(carry,
    string_from_num_alphabet_v1[round(rands(0,len(string_from_num_alphabet_v1)-range,1)[0])][0]
    )
  ):

  (
pointer<length&&vers==1&&is_list(range)
  )?

string_random_v1(length,range,vers,pointer+1,str(carry,
    string_from_num_alphabet_v1[round(rands(range[0],range[1],1)[0])][0]
    )
  ):

//@helper

assert(false,str("function definition overrun for function string_random_v1 with arguments length",lenght,",   range",range,",   vers",vers,",    pointer",pointer,",   carry",carry));



echo(string_random(100));

/*

echo(string_random(100,10));

echo(string_random(100,-5));

echo(string_random(100,[1,10]));

*/