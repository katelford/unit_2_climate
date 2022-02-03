#Condition statements
#01-02-22


num=-2
if(num<0){num=num*-1}
num


#can put comments in the statement
if(num<0){
  print("num is a negative number") 
  num=num*-1 
  print("I turned num into a positive number")
} else{
  print("don't worry, num is positive")
}


#exercise

#rec_temp=98.4
#rec_temp=99.5
#rec_temp=102.1

median_temp=98.4

if(rec_temp=median_temp){
  print("No fever")
 if(rec_temp>median_temp){
  print("Low fever")
} }


#else if statements
a=55
b=55

if(a>b){
  print("a won")   #tier the logical conditions, so once a statement is triggered, it won't continue down the statements
} else if(a<b){
  print("b won")
} else{
  print("it was a tie")
}


#if else statements
a=0
reciprocal=ifelse(a!=0, 1/a, NA)
reciprocal

b=c(13, 0, -6, 4)
reciprocal_2=ifelse(b!=0, 1/b, NA)
reciprocal_2

my_data=cbind(b, reciprocal_2)   #cbind creates columns
my_data
