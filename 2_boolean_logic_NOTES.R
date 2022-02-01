#Boolean logic
#01-02-22


vec=c(1, 0, 2, 1)
vec[c(F, T, T, F)]


#Logical operators

# > , a>b , Is a greater than b?
# >= , a>=b, Is a greater than or equal to b?
# <, a<b, Is a less than b?
# <=, a<=b, Is a less than or equal to b?
# ==, a==b, Is a equal to b?
# !=, a!=b, Is a not equal to b?
#%in%, a%in%c(a, b, c), Is a in the group c(a, b, c)?


#Subsetting a dataframe
world_oceans = data.frame(ocean=c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),
                          area_km2=c(77e6, 156e6, 69e6, 14e6, 20e6),
                          avg_depth_m=c(3926, 4028, 3963, 3953, 4500))

world_oceans$avg_depth_m>4000   #test condition
world_oceans[world_oceans$avg_depth_m > 4000, ]   #only outputs the two rows that are true for the test condition and outputs all the columns

world_oceans$ocean[world_oceans$avg_depth_m > 4000]   #putting the $ocean at the beginning specifies the column outside so you don't need the column

sum(world_oceans$avg_depth_m>4000)   #false is 0, true is 1


#Boolean operators

# &, cond1&cond2, Are both `cond1` and `cond2` true?   #need full condition i.e. x>3&x<10
# |, cond1|cond2, Is one or more of `cond1` and `cond2` true?
# xor, xor(cond1, cond2), s exactly one of `cond1` and `cond2` true?
# !, !cond1, Is `cond1` false? (e.g., `!` flips the results of a logical test)
# any, any(cond1, cond2, cond3, ...), Are any of the conditions true?
# all, all(cond1, cond2, cond3, ...), Are all of the conditions true?


#Example
world_oceans[world_oceans$avg_depth_m<4000&world_oceans$area_km2<50e6, ]


#with NA
vec_2=c(1, 2, 3, NA)
is.na(vec_2)   #displays which are NA
any(is.na(vec_2))
all(is.na(vec_2))



