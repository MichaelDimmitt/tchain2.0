
## These will become preflight checks for the test suite.
## 28  vi ~/.bashrc - has no dupes in the file.
##
## 7-23 matches 30-45
## meaning the unique lines are 24-29
##
## 1: vi new_c/97_lunchpool/lunchpool-react
## 2: git add .
## 3: git diff
## 4: rm text.txt
## 8: vi text.txt
## 9: vi te

# tchain(){
#   main history $*
# }
#
# fchain(){
#   filename=$1
#   shift
#   main $(cat filename) $*
# }
#
# example call
# fchain $file git add .
#
# main(){
# command=$1
# shift
# ## if first or last is ... ~value ... tchain!!!
# $command | grep $*
# }


