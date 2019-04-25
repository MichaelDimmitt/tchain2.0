#!/usr/bin/env bats

load 'helpers';

@test 'assert_equal()' {
  assert_equal 'true' 'true'
}
