%{
Rishi Ramesh Aiden Lab Application February 2018
Problem1A.m

I didn't know how to pass an argument in the call line


requires:N/A
input:Vector of bucket sizes, Target value

output:Says whether or not the set of buckets can sum up to the target
value in a combination of sums
%}


%{
Calls functions.
Requires input of bucket_sizes matrix and target_value integer

example:
 
>>Problem1A([4,12],24)

These buckets can sum up to the target!

%}

function Problem1A(bucket_sizes,target_value)


bucket_sizes=pare_buckets(bucket_sizes);

multiplier_set=ones_analysis(bucket_sizes,target_value);

possiblitity_check(multiplier_set,bucket_sizes,target_value);

return


%{
Removes any buckets that are repeats or multiples of another bucket
input vector of bucket sizes
%}

function bucket_sizes=pare_buckets(bucket_sizes)

%initializes removals matrix, marks the larger bucket that is a multiple of (but not
%the same) as other buckets
removals=[];
for j=1:length(bucket_sizes)
    for k=1:length(bucket_sizes)
        if mod(bucket_sizes(j)/bucket_sizes(k),1)<0.01 && bucket_sizes(j)/bucket_sizes(k)>1
            if isempty(find(removals==j,1))
                removals=[removals,j];
            end
        end
    end
end

%marks one of two buckets that are identical
for j=1:length(bucket_sizes)
    for k=1:length(bucket_sizes)
        if bucket_sizes(j)==bucket_sizes(k) && j~=k
            if isempty(find(removals==j,1)) && isempty(find(removals==k,1))
                removals=[removals,j];
            end
            
        end
    end
end

%removes marked buckets, starting from end of vector
removals=sort(removals);

for k=length(removals):-1:1
    bucket_sizes(removals(k))=[];
end



return

%{
input bucket sizes vector and target value. 
outputs set of multipliers that when multiplied with the vector of bucket
sizes will output a number with the same ones digit as the target vector.

Looks at ones digits of all the buckets and the target value to see what
the ones digits of the multipliers has to be in order to produce the ones
digit of the target value.
%}

function multiplier_set=ones_analysis(bucket_sizes,target_value)
%initializes matrix to find combination of inputs that will get target ones
%digit

%finds ones digits of buckets and targt
bucket_ones=mod(bucket_sizes,10);
target_ones=mod(target_value,10);
ones_set=[];

%calculates all possible ones digits from all combinations of multiplier
%ones digits with bucket value ones digits. If ones value matches that of
%target value, multipliers added to matrix of possibilities.
for count=1:10^length(bucket_ones)
    
    for j=1:length(bucket_sizes)
        multipliers(j,1)=floor(mod(count,10^(j))/10^(j-1));
    end
    
    if mod(bucket_ones*multipliers,10)==target_ones
        ones_set=[ones_set,multipliers];
    end
end


%for each set of ones, calculates the different multipliers with that ones
%digit that could multiply with a bucket but still keep it under the target
%value

multiplier_set=[];

%finds maximum size of a multiplier for each bucket
for k=1:length(bucket_sizes)
    maxmult(k,1)=floor(target_value/bucket_sizes(k));
end


maxmultmult=floor(maxmult/10);

multiplier_set=[];

for count=1:length(ones_set)
    ones_choice=ones_set(:,count);
    
    multmult=zeros(size(maxmultmult));
    
    for k=1:prod(maxmultmult+ones(size(multmult)))
        
        multiplier_set=[multiplier_set;(10*multmult+ones_choice)'];
        
        multmult(end)=multmult(end)+1;
        for j=length(multmult):-1:1
            if multmult(j)>maxmultmult(j) && j>1
                multmult(j)=0;
                multmult(j-1)=multmult(j-1)+1;
            end
        end
    end
    
end

%if any of the multiplier sets have a value larger than the maximum
%multiplier, that set is removed
for pare_count=length(multiplier_set):-1:1
    check=0;
    for k=1:size(multiplier_set,2)
        if multiplier_set(pare_count,k)>maxmult(k)&&check==0
            multiplier_set(pare_count,:)=[];
            check=1;
        end
    end
end
return

%{
Spits out whether or not the buckets can reach a target value
inputs: multiplier_set, bucket_sizes, target_value
output: prints if the values can reach the target value.
%}
function possiblitity_check(multiplier_set,bucket_sizes,target_value)
solved=0;
for k=1:length(multiplier_set)
    if solved==0
        if bucket_sizes*multiplier_set(k,:)'==target_value 
            solved=1;
            display('These buckets can sum up to the target!');
        end
    end
end

if solved==0
    display('Hmm... These buckets can not add up to the target');
end
return






%{
Initial attempt, brute force method


%initializes necessary variables
maxiter=0;
itercount=0;
multipliers=0;
count=0;

for k=1:length(bucket_sizes)
    maxiter(k)=floor(target_value/bucket_sizes(k));
end

itercount=ones(size(maxiter))+maxiter;

itercount=prod(itercount);

multipliers=zeros(length(bucket_sizes),1);

for count=0:itercount
    val=0;
    
        val=bucket_sizes*multipliers;
        
        if val>target_value-0.5 && val<target_value+0.5
           multipliers
        end
    
    multipliers(end)=multipliers(end)+1;
    for j=length(multipliers):-1:1
        if multipliers(j)>maxiter(j) && j>1
            multipliers(j)=0;
            multipliers(j-1)=multipliers(j-1)+1;
        end
    end
end


%}