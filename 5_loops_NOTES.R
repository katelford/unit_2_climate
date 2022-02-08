#Loops
#03-02-22


for(i in c(1:4)){   #i for iterand, aka iterations, but you can name it whatever you want
  print("one run of my loop")
}

for(i in c(1:4)){
  print(i)
}

i   #this shows the last value that was assigned to i, helpful if the loop breaks so you know where it ran into an issue


#works with words too
words=c("my", "second", "for", "loop")
for(word in words){
  print(word)
}


#indexing
my_vector=c(1,3,4,5,2)
n=length(my_vector)   #length because it's a vector, dim if it was a matrix
my_vector_squared=rep(NA, n)

for(i in seq(n)){
  my_vector_squared[i]=my_vector[i]^2
}

my_vector_squared
cbind(my_vector, my_vector_squared)


#exercise
num=6
factorial=1

for(i in seq(num)){
  factorial=factorial*i
  print(factorial)
}


#another for loop
vec3=c(1,2,5,7)
total=0
for(i in seq(length(vec3))){
  total=total+vec3[i]
  print(total)
}


#nested for loop
mat=matrix(c(2,0,8,5,9,-6), nrow=2, byrow=T)
mat_squared=matrix(NA, nrow=2, ncol=3)
for(i in seq(dim(mat)[1])){
  for(j in seq(dim(mat)[2])){
    mat_squared[i,j]=mat[i,j]^2
    print(paste("i=", i, "j=", j))
  }
}

mat_squared


#while loops
x=1
while(x>0){   #this is an infinite loop, so to stop it press esc or click the red stop button at the top right of console
  x=x+1
}


x=-2
while(x<0){
  x=x+1
}


#fishing game
rnorm(n=1, mean=2, sd=1)   #n is catching 1 fish at a time, with an average weight of 2. This generates random numbers with these parameters
total_catch=0
catch_limit=50 #in lbs
n_fish=0
while(total_catch<catch_limit){
  n_fish=n_fish+1
  fish_weight=rnorm(n=1, mean=2, sd=1)
  total_catch=total_catch+fish_weight
}

n_fish   #if you rerun the loop, you'll get new outputs
total_catch








