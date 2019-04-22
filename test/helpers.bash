
node_module_path() {
  bats_location=$(which bats);
  echo "${bats_location%/*/*/*/*}";
}
load "$(node_module_path)/bats-assert/load.bash";
load "$(node_module_path)/bats-support/load.bash";

