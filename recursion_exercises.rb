# Warmup

# range iteratively
def range(start_point, end_point)
    return [] if end_point < start_point # base case return empty array if the end point is smaller than start_point meaning start point should always be small to run
    range_array = [] # setting range_array variable to an empty array

    (start_point...end_point).each do |num| # taking each number between start and end point
        range_array << num # shoveling into the range
    end

    range_array # returned the range
end

# test
# range(1, 5) #=> [1, 2, 3, 4]
# range(5,1) #=> []

# range recursively
def range(start_point, end_point)
    return [] if end_point < start_point # base case return empty array if the end point is smaller than start_point meaning start point should always be small to run
    end_point_less_one = end_point - 1 # takes the end point and return a end point less 1 
    return end_point_less_one if start_point == end_point_less_one # return the end_point less 1 if the start point == end_point_less_one
    # example if start = 5 & end = 6; end_point_less_one = 5 return 5
 
   new_start = start_point + 1 # adding 1 to the start point for recusive call
   range_array = [start_point] << range(new_start, end_point) # range_array = the array of the original start_point << recursive range with the new_start 
   range_array.flatten # flatting the range array to equal a single array
end

# range recursively -> Best Solution
def range(min, max) # range accepts min and max parameter
    return [] if min >= max #base case return empty array if min greater or equal to the max - 1
    range(min, max -1) << max - 1 # recursive call range passing the min and decreasing the max shuffling in the original max - 1 
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

class Array
    def deep_dup #=> copies the objects within objects taking each sub array and creating a copy that can minipulated with out changing the original array.
        self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
    end
end

def fibonacci(n) 
    if n <= 2
        [0,1].take(n) #=> take will return an array of the first n values 
    else
        fibs = fibonacci(n-1)
        fibs << fibs[-2] + fibs[-1]
    end
end


def bsearch(array, target)
    return nil if array.empty?

    mid_index = array.length / 2

    case target <=> array[mid_index]
    when -1
        bsearch(array.take(mid_index), target)
    when 0
        mid_index
    when 1
        subs = bsearch(array.drop(mid_index + 1), target)
        subs.nil? ? nil : (mid_index + 1) + subs
    end

end

class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)

  end

  def merge(left, right)
    merged_array = []

    until left.empty? || right.empty? 
        if left.first < right.first
            merged_array << left.shift
        else
            merged_array << right.shift
        end
    end

    merged_array + left + right
  end

    
end


def subsets(array)
    return [[]] if array.empty?

    subs = subsets(array.take(array.count - 1))
    subs.concat(subs.map { |sub| sub + [array.last] })
end

class Array

    def permutations(array)
        return [array] if array.length <= 1

        first = array.shift
        perms = permutations(array)
        total_permutations = []

        perms.each do |perm|
            (0..perm.length).each do |i|
                total_permutations << perm[0...i] + [first] + perm[i + -1]
            end
        end

        total_permutations
    end

end


def make_change(amount, coins = [25, 10, 5, 1])
    return [] if amount == 0

    best_change = nil

    coins.each do |coin|
        next if coin > amount
        change_for_rest = make_change(amount - coin, coins )
        change = [coin] + change_for_rest

        if best_change.nil? || change.count < best_change.count
            best_change = change
        end
    end
    
    best_change 
end











