# Warmup

# range iteratively
def range(start_point, end_point)
    return [] if end_point < start_point
    range_array = []

    (start_point...end_point).each do |num|
        range_array << num
    end

    range_array
end

# test
# range(1, 5) #=> [1, 2, 3, 4]
# range(5,1) #=> []

# range recursively
def range(start_point, end_point)
    return [] if end_point < start_point
    end_point_less_one = end_point - 1
    return end_point_less_one if start_point == end_point_less_one
 
   new_start = start_point + 1
   range_array = [start_point] << range(new_start, end_point)
   range_array.flatten
end

# range recursively -> Best Solution
def range(min, max)
    return [] if min >= max
    range(min, max -1) << max - 1
end

# Exponentiation
def exp(b, exp)
    return 0 if exp == 0
    b * exp(b, exp - 1)
end

# exp(6,0) #=> 0 
# exp(250,0) #=> 0
# exp(2,3) #=> 8

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp1(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        exp1(b, n / 2) ** 2
    else
        b * (exp1(b, (n - 1) / 2) ** 2)
    end
end


