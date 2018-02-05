%{
Rishi Ramesh Aiden Lab Application February 2018
Problem2A.m

I don't know how to create a gui interface or launch this as an app.
 
This solution replaces certain numbers that resemble a letter with that
letter. I wanted to recognize certain words in the numbers used, but I
didn't know how to import a dictionary into matlab. 

requires:N/A
input:N/A

output:string with letters and numbers
%}

function Problem1B

%requests user input
 inputval=input('Type number here');

 %converts to string and then replaces numbers in the output variable
inputval=num2str(inputval);

output=inputval;

    output(inputval=='0')='o';
    
    output(inputval=='1')='l';
    
    output(inputval=='3')='e';
    
    output(inputval=='4')='a';
    
    output(inputval=='6')='b';
    
    output(inputval=='9')='g';


output
return

