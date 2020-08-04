a <-(1:9)  #integer
u <-c("a", 1L, 1) # L suffix for integer, by default numeric(double precision)
b <-c(T , 2) # when mixed class in vector they are co-erced to a common denominator
c <-c(F, "F")
class(c)
length(c)

##Type Conversion
a <-(1:20)
as.numeric(a)
as.character(a)
as.logical(a)

##characters can only be co-erced into complex
as.complex(u)
z <-c("a","b","c")
as.complex(z)


