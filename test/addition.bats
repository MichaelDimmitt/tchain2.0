#!/usr/bin/env bats

load 'helpers';

@test "addition using bc" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}

@test 'assert_equal()' {
  assert_equal 'have' 'want'
}
