##### Superflous Tests
load 'helpers';
res(){
  echo "$1 $(( $(echo "$1" | wc -l ) - 2 ))" | tr -d '\n'
}

########## Superflous Tests .......
file=$BATS_TEST_DIRNAME/mock_history.sh

@test "add provides two results" {
  result=$(res "
    $(cat $file | grep 'git add .')
  ")

  expect=$(res "
    8  git add .
31  git add .
  ")
  assert_equal "$result" "$expect"
}

@test "diff provides three results" {
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

@test "rm text.txt provides 4 results" {
  result=$(res "
    $(cat $file | grep 'rm text.txt')
 ")

  expect=$(res "
    8091  rm text.txt
 8093  rm text.txt
 8097  rm text.txt
 8102  rm text.txt
  ")
  assert_equal "$result" "$expect"
}

@test "vi text.txt provides 4 results" {
  result=$(res "
    $(cat $file | grep 'vi text.txt')
")
  expect=$(res "
    8089  vi text.txt
 8090  vi text.txt
 8092  vi text.txt
 8094  vi text.txt
 8095  vi text.txt
 8096  vi text.txt
 8098  vi text.txt
 8099  vi text.txt
 ")
  assert_equal "$result" "$expect"
}

@test "vi te, provides 8 results" {
  result=$(res "
$(cat $file | grep 'vi te')
")
  expect=$(res "
8089  vi text.txt
 8090  vi text.txt
 8092  vi text.txt
 8094  vi text.txt
 8095  vi text.txt
 8096  vi text.txt
 8098  vi text.txt
 8099  vi text.txt
 8101  vi te
")
  assert_equal "$result" "$expect"
}
