#!/usr/bin/env bats

load 'helpers';

res(){
  echo "$1 $(( $(echo "$1" | wc -l ) - 2 ))" | tr -d '\n'
}

file=$BATS_TEST_DIRNAME/mock_history.sh

@test "one occourance of command vi ~/.bashrc" {
  result=$(res "$(cat $file | grep "vi ~/.bashrc")")
  expect=$(res "28  vi ~/.bashrc")
  assert_equal "$result" "$expect"
}

@test "Call tchain without tilda ... for command plus previous command chained." {
# tchain git pull
  result=$(res "$(cat $file | grep "vi ~/.bashrc")")
  expect=$(res "28  vi ~/.bashrc")
  assert_equal "$result" "$expect"
}
@test "Call tchain with tilda at the end and semicolins handled ... for command plus prev command chained." {
# tchain git pull ~;;;
  result=$(res "$(cat $file | grep "vi ~/.bashrc")")
  expect=$(res "28  vi ~/.bashrc")
  assert_equal "$result" "$expect"
}
@test "if multiples are found, tchain with tilda example: " {
# git pull found at lines 10 30 and 40 input a line number to chain that context into a single line.
# tchain git pull~ 
  result=$(res "
    $(cat $file | grep 'git diff')
  ")
  expect=$(res "
    0  git diff
7  git diff
30  git diff
  ")
  assert_equal "$result" "$expect"
}
@test "tchain from specific number." {
# tchain 29 ~2
  result=$(res "")
  expect=$(res "")
  assert_equal "$result" "$expect"
}
@test "Call tchain with tilda at the beginning ... for command plus previous 3 commands chained." {
# tchain ~3 git pull
  result=$(res "$(cat $file | grep "vi ~/.bashrc")")
  expect=$(res "28  vi ~/.bashrc")
  assert_equal "$result" "$expect"
}

