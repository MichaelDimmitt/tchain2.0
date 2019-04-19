## TChain!!! …

## tchain2.0

## Why this command is useful:
Tchain will allow you to navigate back in your terminal history ... 
<br/>And chain commands you repeat together often into a single bash one-liner.

Allowing you to paste and execute the new one-liner or assign it to an alias a function.
## Setup for Bats Bash Test Suite (used by this project)<br/>Ignore if you do not want to run the tests.
```bash
cd ~;
startingFolderLocation=$OLDPWD &&
git clone https://github.com/sstephenson/bats.git &&
cd bats &&
./install.sh /usr/local &&
cd $startingFolderLocation
```

## Plan for getting it done ... 
When User "up arrow"s in terminal to the thing they want in terminal history, 

User will put the tchain function at the beginning of the command they are seeing.

The command that you were on that is now after the function tchain and is passed into the tchain function as parameters.

Additionally `~NUM`, or just `~` can be passed in to chain commands previous to that command in history.

The function sanitizes the command of `;` and `~` without harming commands that actually need those characters.

If multiple commands are found they will all be listed with the line numbers and prompt which line to do the chaining.

Finally, upon success ... the command in oneline fashion is echoed to the user as a built string.

## Payoff
User can now assign that one-liner to an alias a function or just paste it below for the desired result. 🙂

## Example Function Calls:
```bash 
# Call tchain without tilda ... for command plus previous command chained.
tchain git pull 
result: 'git pull'

# Call tchain with tilda at the end and semicolins handled ... for command plus previous command chained.
tchain git pull ~;;;
result: 'git status; git pull;'

# if multiples are found, tchain with tilda example: 

$ tchain git pull 
result: '
git pull found at lines 10 30 and 40 input a line number to chain that context into a single line.

09 git status
10 git pull;

29 cd ..;
30 git pull

39 git show;
40 git pull
'

$ tchain 29
result: 'cd ..; git pull'

# Call tchain with tilda at the beginning ... for command plus previous 3 commands chained.
tchain ~3 git pull
result: 'cd ..; cd example_repo; git status; git pull;'
```

UserFlow #1
1) User up arrows to the command they used a while back.
2) user goes to beginning of the line with ctrl+A.
3) user writes `tchain `
4) user writes ctrl+E.
5) user writes ~5
6) expected result last 5 commands from history at that point are put together into a oneline delimited by semicolins.

UserFlow #2
1) User up arrows to the command they used a while back.
2) user goes to beginning of the line with ctrl+A.
3) user writes `tchain ~2 `
4) expected result plus the 2 commands previous from history are put together into a oneline delimited by semicolins.
5) example the command found was git pull;


```bash
tchain git pull

tchain(){  
	history | grep $*
}

## context Context History Query Info:
##### Describe  # what do you do about newlines. Large commands.
  ## note
  # this implementation of tchain has ~1, ~0, ~(-NUM), ~; all equating to  "~"
  # tchain without ~ will just return that command echoed to the screen.

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
