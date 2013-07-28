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

# def divisor_counter(n)
#   require 'prime'
#   divisors = ['self']
#   unless Prime.instance.prime?(n)
#     for i in (1..n/2)
#       if n % i == 0
#         divisors << i
#       end
#     end
#   end
#   p "#{n} has #{divisors.count} divisors"
#   divisors.count
# end

def divisor_counter(n)
  divisors = 2
  require 'prime'
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


