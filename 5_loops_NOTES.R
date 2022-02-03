#Loops
#03-02-22


for(i in c(1:4)){   #i for iterand, aka iterations
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














