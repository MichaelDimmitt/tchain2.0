#!/usr/bin/env bats

load 'helpers';

## none of these are currently connected to history file.

res(){
  echo "$1 $(( $(echo "$1" | wc -l ) - 2 ))" | tr -d '\n'
}

@test "Call tchain without tilda ... for command plus previous command chained." {
# tchain git pull 
  result=$(res "
git pull
")

  expect=$(res "
git pull
")

  assert_equal "$result" "$expect"
}
 
@test "Call tchain with tilda at the end and semicolins handled ... for command plus prev command chained." {
# tchain git pull ~;;;
  result=$(res "
git status; git pull;
")

  expect=$(res "
git status; git pull;
")

  assert_equal "$result" "$expect"
}

@test "if multiples are found, tchain with tilda example: " {
# tchain git pull~ 
  result=$(res "
git pull found at lines 10 30 and 40 input a line number to chain that context into a single line.

09 git status
10 git pull;

29 cd ..;
30 git pull

39 git show;
40 git pull
")
  expect=$(res "
git pull found at lines 10 30 and 40 input a line number to chain that context into a single line.

09 git status
10 git pull;

29 cd ..;
30 git pull

39 git show;
40 git pull
")
  assert_equal "$result" "$expect"
}

@test "tchain from specific number." {
# tchain 29 ~2
  result=$(res "
cd ..; git pull
")

  expect=$(res "
cd ..; git pull
")

  assert_equal "$result" "$expect"
}

@test "Call tchain with tilda at the beginning ... for command plus previous 3 commands chained." {
# tchain ~3 git pull
  result=$(res "
cd ..; cd example_repo; git status; git pull;
")

  expect=$(res "
cd ..; cd example_repo; git status; git pull;
")

  assert_equal "$result" "$expect"
}

