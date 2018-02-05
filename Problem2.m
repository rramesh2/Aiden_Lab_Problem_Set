%Solution

%{
In order to most efficiently match the lines with the same unique
identifier, the identifiers need to be put through a series of filters. The
first is length, then by the first letter, and then if wanted by the second
letter. The letters can be in terms of buckets (from A-G,H-P,Q-Z) or in
terms of individual letter. After there are smaller sets, you can look for
matches within that smaller set. 

Looking for matches, you can create a matrix where the the identifiers from 
one file is the columns and the other file's identifiers are the rows, 
and the number of letter matches are stored in the matrix elements.
If for both identifiers the full length has matches made, then those lines
would be merged. 

%}


%pseudo-code

%{
Create two sets by extracting identifiers from each dataset separately.

Create sets for each different length of identifiers within each set. 
    Create a new set each time a new length comes up.

Create sets within each set sorting by first letter.

Match the respective sets and create a matrix where one dataset's
identifiers are the column labels and the other dataset's identifiers are
the row labels.

Find the number of matches of letters in each element. If the match is complete, extract that identifier. 

Find the input from each dataset with the identifier and merge those lines. 
%}



%pros, cons, and potential issues

%{
One con is that this method requires a large amount of processing power that increases
exponentially with file size. It'd be hard to integrate various forms of
optimization into this method.

The pros are that this method can be updated to increase the filtering
levels quickly and simply. The matrix is efficient due to the fact that the
filtering provides a relatively small number of identifiers to
cross-reference.

The sets may be too big to quickly determine matches.

Due to this, there may need to be an additional layer of filtering or
simply more selective filtering. If the processor also can not store files
that large, it may be more efficient to work with one set at a time. 


%}