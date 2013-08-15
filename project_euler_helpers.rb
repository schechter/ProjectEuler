def is_prime n
  for i in 2..(n - 1)
    if (n % i) == 0
      return false
    end
  end
  true
end

def is_palindrome(array)
  j = 0
  if array.length.even?
    half = array.length/2
  else
    half = (array.length/2)+1
  end
  for i in (0..array.length)
    j -= 1
    if array[i] == array[j]
      if  i == half
        return true
      end
    else
      return false
    end
  end
end

def check_rows(grid)
  candidates = []
  for i in (0..(grid.length-1))
    for j in (0..(grid.length-4))
      candidates << (grid[i][j] * grid[i][j+1] * grid[i][j+2] * grid[i][j+3])
    end
  end
  candidates.max
end

def check_columns(grid)
  candidates = []
  for i in (0..(grid.length-1))
    for j in (0..(grid.length-4))
      candidates << (grid[j][i] * grid[j+1][i] * grid[j+2][i] * grid[j+3][i])
    end
  end
  candidates.max
end

def check_diagonals(grid)
  [check_diagonals_dr(grid), check_diagonals_dl(grid)].max
end

def check_diagonals_dr(grid)
  candidates = []
  for i in (0..(grid.length-4))
    for j in (0..(grid.length-4))
      candidates << (grid[i][j] * grid[i+1][j+1] * grid[i+2][j+2] * grid[i+3][j+3])
    end
  end
  candidates.max
end

def check_diagonals_dl(grid)
  candidates = []
  for i in (0..(grid.length-4))
    for j in (0..(grid.length-4))
      candidates << (grid[i][j+3] * grid[i+1][j+2] * grid[i+2][j+1] * grid[i+3][j])
    end
  end
  candidates.max
end

def triangle_num_gen(n)
  (n * (n + 1 ))/2
end


def divisor_counter(n)
  divisors = 2
  for i in (2..(n**0.5))
    if n % i == 0
      divisors += 2
    end
  end
  divisors
end

def collatz_sequence(n)
  sequence = [n]
  while n != 1
    if n.even?
      n = n/2
  sequence << n
  else
    n = ((3 * n) + 1)
    sequence << n
  end
end
sequence.count
end

def prob18recursion(triangle, current_node, paths, path_length) #Find the maximum total from top to bottom of the triangle below:
  path_length = path_length || 0
  path_length += triangle[current_node[0]][current_node[1]]
  if current_node[0] == triangle.length- 1
    return path_length
  else
    # unless current_node[0] == triangle.length-1
    paths << prob18recursion(triangle, [current_node[0]+1, current_node[1]+1], paths, path_length)
    paths << prob18recursion(triangle, [current_node[0]+1, current_node[1]], paths, path_length)
  end
end

def is_sunday(n)
  if n % 7 == 0
    1
  else
    0
  end
end

def is_amicable(n)
  x = sum_of_divisors(n)
  if sum_of_divisors(x) == n && x != n
    return x, n
  end
  0
end

def sum_of_divisors(n)
  sum = 0
  for i in (1..((n/2) +1))
    if n % i == 0
      sum += i
    end
  end
  sum
end

def is_abundant_number?(n)
  if n < sum_of_divisors(n)
    return true
  end
  false
end

def is_sum_of_two_from_array(n, array)
  for i in array
    j = n - i
    if array.include? j
      return true
    end
  end
  false
end

def get_subsets(array)
  if array.length == 0
    return [[]]
  end
  subsets = []
  first = array.first
  rest = array.drop(1)
  get_subsets(rest).each do |partial_subset|
    subsets << partial_subset
    next_subset = partial_subset + [first]
    subsets << next_subset
  end
  subsets
end

def is_pandigital(a,b,c)
  a, b, c = a.to_s.chars, b.to_s.chars, c.to_s.chars
  c << a << b
  c.flatten!.sort!
  if c.length == 9 && c[0] =='1' && c[1] =='2' && c[2] =='3' && c[3] == '4' && c[4] =='5' && c[5] == '6' && c[6] =='7' && c[7] =='8' && c[8] =='9'
    return true
  end
  false
end

def factorial(num)
  (2..num).inject(1) { |f, n| f * n }
end

