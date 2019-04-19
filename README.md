## TChain!!! …

## tchain2.0
Now knowing bash ... lets try this again 🙂. Terminal chaining.

```bash
tchain git pull

tchain(){  
	history | grep $*
}

## context Context History Query Info:
##### Describe  # what do you do about newlines. Large commands.
  ## Test 1:
  ## the below option should be one line in history...
  ## if it is not then the program should see it as such.
  # echo hi &&
  # echo bye &&
  # echo done
  
  ## Test 2:
  #  echo '
  #
  #   hi
  # '
  
  # Test 3:
  # Semicolons should only be removed from the ending of commands
  # echo ' 
  #  frog; 
  #  still with single quotes.
  #'
  
  # Test 6:
  # if semicolins match out to remove semicolon from command.
	
  
### end Describe  newlines and large commands.
## end Context History Query Info

#### Describe Evaluating inputs for after tchain command is used

  # Test 4:
  # tchain without any command if single entry found in history just finds the first instance from history ... 
  #### Expected Output: echo 'git pull'
  
  # Test 5	
  ## tchain without any command if multiple, presents the list of instances and line numbers of history found.
  # tchain git pull
  #### Expected: echo 'git pull found at lines 10 30 and 40'

  # Test 6:
  ## regex to match out ending ~NUM.
  # tchain git pull~3
  # expected: 'cd ..; cd tchain_repo; git status; git pull;
  
  # Test 7:
  ## regex to match out ~ without NUM.
  # tchain git pull~
  # expected: 'git status; git pull'
  
  # Test 8: 
  ## Multiple history items found an error message is returned.
	## If more than one line returned … prompt user options and tell them they can use line number.
  # tchain git pull~;
  # tchain git pull~;;;;
  # expected: 'git status; git pull'
  
#### end Describe
```
