**Please build the program in dev branch**

# Greetings!
This homework is designed to force you to exercise your knowledge of the Swift programming language. This homework does not involve iOS in any way.

Your task is simple: Make the code compile, and make all the unit tests pass. You may not change the
tests that already exist in the files in the "src/test" subdirectories; you will also be asked to add
a few tests, as well.

## To do that...
... you must first obtain a copy of the source. Do that by cloning this repository:

    git clone https://bitbucket.org/TedNeward/uw-ios-simplecalc simplecalc

This will create a local copy of the project. However, in order to *store* your changes to your own
GitHub account, you need to create a new repository on GitHub (call it `simplecalc`), and then
change the project's settings to point to that new repository as the remote origin.

    git remote set-url origin https://github.com/[your-ID]/simplecalc.git

This will work regardless of whether you got the syntax of the URL correct or not, so do a quick
push to make sure it all worked correctly:

    git push

Git will ask you for your username and password, then (if everything was done correctly), it will
upload the code to the new repository, and this is your new "home" for this project going forward.
Verify the files are there by viewing your GitHub project through the browser.

***NOTE:*** Your grade for this assignment (and all future assignments) will be based on what we
see in the GitHub repository, and nothing else. If it isn't in GitHub, it doesn't exist.

## Your tasks

You are to implement a simple calculator as a command-line application. The project is configured to
run as a command-line application on macOS (not iOS), and should have everything set up, including
some unit tests to make sure that you are covering a good range of possibilities. Your assignment
is to:

* make the code compile
* make the code pass the unit tests

All of the work you will do will be in the "main.swift" file, inside of the "Calculator" class.
There are two methods in here, one that takes an array of Strings as input, and one that takes a
single String. The single String `calculate` takes the String and splits it into multiple Strings
and passes that to the array-of-Strings version of `calculate`, so the bulk of your work will be
in there.

You should make sure your `calculate` method can handle the following kinds of input:

* `calculate(["2", "+", "2"])`: This should return 4
* `calculate(["2", "-", "2"])`: This should return 0
* `calculate(["2", "/", "2"])`: This should return 1
* `calculate(["2", "%", "2"])`: This should return 0
* `calculate(["2", "*", "2"])`: This should return 4

For those who aren't aware of it, the "%" operator is called the "modulo" operator, and it is the
"remainder" result in an integer division that does not divide equally. Thus, 5 % 2 is 1 (5 divided
by 2 is 2 remainder 1), 10 % 3 is 1 (10 divided by 3 is 3 remainder 1) and 4 % 2 is 0 (4 divided by
2 is 2 remainder 0).

The `calculate` method also needs to support a few other less-traditional expressions as well:

* `calculate(["1", "2", "3", "4", "5", "count"])`: This should return a count of all the number arguments,
  which in this case will be 5.
* `calculate(["1", "2", "3", "avg"])`: This should return the average of the numbers, which is all of the
  values added up and divided by the number of arguments ( (1 + 2 + 3) / 3 in this case).
* `calculate(["5", "fact"])`: This should calculate the factorial of the single number passed in, which
  is that number multiplied by each number below it. 5-factorial is 5 * 4 * 3 * 2 * 1, or 120.
  
For this latter set of operations, it is safe to assume that ["count"] is 0 (no arguments),
["avg"] is also 0, and ["fact"] is 0. ["1", "fact"] should return 1, and ["0", "fact"] should
also return 1. (Yes, 0-factorial is 1. True story.)

The unit tests in the project should be testing for all these edge cases already. If the tests all
pass, you will get full marks.

## Running the tests

When opening the project in XCode, make sure the "SimpleCalcTests" scheme is selected to run the tests.
Once it is selected, you should be able to do "Project | Test" from the menubar, or cmd-U, to run
the tests. The Test navigator (on the left side) will show which tests succeeded and which failed.

**NOTE**: You should not need to modify the test sources. Changing the tests to make your code pass
is technically called "cheating" and is frowned-upon in the halls of corporate America. However, if
you have more tests you would like to add, feel free to do so in the ExtendedCalcTests class, following
the same pattern you see in SimpleCalcTests. (This is where you would put tests to demonstrate your
extra-credit work, for example.)

## Extra credit work

Two options are available to you to earn extra points:

* Modify the Calculator to work on negative numbers. (1 point)
* Modify the Calculator to work on floating-point numbers. (1 point)
* Modify the main.swift code to accept command-line arguments and if present, don't display a prompt
  and simply process the parameters passed. (1 point) 

The last bit deserves further explanation. For example, if the user typed "SimpleCalc 1 + 2" into a
Terminal window, the program would print "3". If the user typed "SimpleCalc 1 2 3 4 5 count", the program 
would print "5". And so on.

To run your application from the command-line, go to the Project navigator, select
"SimpleCalc" *under the Products node* with the mouse, and copy-to-the-clipboard the "Full Path" 
text displayed in the "Identity and Type" window to the far right. (Or you can click the "arrow"
just to the right of that path, but that simply opens a Finder window to that directory; you will
want the path on the clipboard so you can use it from a Terminal.) Now open a Terminal, and type
the full path to run the application from the command-line. So on my machine, that looks something
like this:

  `/Users/ted/Library/Developer/Xcode/DerivedData/SimpleCalc-aunbkhtoyvtwlqehsvhnekzqnpjx/Build/Products/Debug/SimpleCalc`

How incredibly intuitive, yes (he said, sarcastically)? It is possible to change this default
directory where XCode puts its builds, but for our purposes, it's not important.


