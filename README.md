## TChain!!! …

## tchain2.0
Now knowing bash ... lets try this again 🙂. Terminal chaining.

```bash
tchain git pull

tchain(){
	
##### Describe  # what do you do about newlines. Large commands.

  ## Option 1:
  ## the below option should be one line in history...
  ## if it is not then the program should see it as such.
  # echo hi &&
  # echo bye &&
  # echo done
  
  ## Option 2:
  #  echo '
  #
  #   hi
  # '
  
  # Case 3:
  # Semicolons should only be removed from the ending of commands
  # echo ' 
  #  frog; 
  #  still with single quotes.
  #'
  
### end Describe 

#### Evaluating inputs for after tchain command is used

  # Case 4:
  # regex to match out ending ~NUM.
  
  # Case 5:
	# regex to match out ~ without NUM.
  
  # Case 6:
	# if semicolins match out to remove semicolon from command.
  

  # Case 7: 
  ## Multiple history items found an error message is returned.
	## If more than one line returned … prompt user options and tell them they can use line number.
  
####

  
	history | grep $*
}
```
