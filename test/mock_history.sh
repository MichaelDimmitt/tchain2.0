0  git diff
7  git diff
8  git add .
9  git commit -m "Try dark-mode"
10  git checkout -b dark-mode
11  git push
12  git remote -v
13  git remote add cheese https://github.com/michaeldimmitt/fek.io.git
14  git push cheese
15      git push --set-upstream cheese dark-mode
16  reveal
17  git checkout master
18  git status
19  git branch --all
20  checkLockFiles(){   result=$(echo "$1" | wc -l);   if [ "$result" -ge "2" ]; then     echo 'two or more lock files detected ... please delete one to continue';   elif [ "$1" == "pack" ]; then     which npm;   elif [ "$1" == "yarn" ]; then     which yarn;   else      echo "$1";   fi;  };
21  npm(){   $helper $*; };
22  yarn(){   $helper $*; };
23  helper(){    lockFilesFound=$(ls | grep "lock" | cut -c 1-4 | grep "pack\|yarn");     packageManager=$(checkLockFiles "$(echo "$lockFilesFound")" npm);   $packageManager $*; }
24   helper "npm" "$*";
25   helper "npm" start;
26   helper npm start;
27  . ~/.bashrc; npm start;
28  vi ~/.bashrc
29  . ~/.bashrc; npm
30  git diff
31  git add .
32  git commit -m "Try dark-mode"
33  git checkout -b dark-mode
34  git push
35  git remote -v
36  git remote add cheese https://github.com/michaeldimmitt/fek.io.git
37  git push cheese
38      git push --set-upstream cheese dark-mode
39  reveal
40  git checkout master
41  git status
42  git branch --all
43  checkLockFiles(){   result=$(echo "$1" | wc -l);   if [ "$result" -ge "2" ]; then     echo 'two or more lock files detected ... please delete one to continue';   elif [ "$1" == "pack" ]; then     which npm;   elif [ "$1" == "yarn" ]; then     which yarn;   else      echo "$1";   fi;  };
44  npm(){   $helper $*; };
45  yarn(){   $helper $*; };

8089  vi text.txt 
8090  vi text.txt 
8091  rm text.txt 
8092  vi text.txt 
8093  rm text.txt 
8094  vi text.txt 
8095  vi text.txt 
8096  vi text.txt 
8097  rm text.txt 
8098  vi text.txt 
8099  vi text.txt 
8100  vi new_c/97_lunchpool/lunchpool-react
8101  vi te
8102  rm text.txt 