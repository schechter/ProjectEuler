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
      p i
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

def is_pandigital(a,b,c)  # takes 3 inputs, checks pandigital 1-9
  a, b, c = a.to_s.chars, b.to_s.chars, c.to_s.chars
  c << a << b
  c.flatten!.sort!
  if c.length == 9 && c[0] =='1' && c[1] =='2' && c[2] =='3' && c[3] == '4' && c[4] =='5' && c[5] == '6' && c[6] =='7' && c[7] =='8' && c[8] =='9'
    return true
  end
  false
end

def is_pandigital_n(num)
  num = num.to_s.chars.sort.join
  case num.length
  when 7
    if num == '1234567'
      return true
    end
  when 8
    if num == '12345678'
      return true
    end
  when 9
    if num == '123456789'
      return true
    end
  when 10
    if num == '0123456789'
      return true
    end
  end
  false
end

def is_pandigital_array(array) # try this return false if n.to_s[0,9].chars.sort.join!='123456789'  
  array.sort!
  if array.include? '0'
    return false
  end
  if array[0] =='1' && array[1] =='2' && array[2] =='3' && array[3] == '4' && array[4] =='5' && array[5] == '6' && array[6] =='7' && array[7] =='8' && array[8] =='9'
    return true
  end
  false
end

def factorial(num)
  (2..num).inject(1) { |f, n| f * n }
end

def how_many_terms(i) # retruns how many time you can factorialize and sum the numbers digits until you enter a loop
  set = []
  current_num = i
  while true
    if set.include? current_num
      return set.length
    end
    set << current_num
    next_num = 0
    num_array = current_num.to_s.chars
    num_array.each do |digit|
      next_num += @factorials1_9[digit]
    end
    current_num = next_num
  end
end

def is_pentagonal(x) # Pn=n(3n−1)/2
  range = [0,500000]
  while true
    test = (range[0] + range[1])/2
    if (test * ((3*test) -1)/2) == x #found the hex number
    return true
    elsif (test * ((3*test) -1)/2) > x
      range[1] = test
    else
      range[0] = test
    end
    if range[1] - range[0] <= 1
      return false
    end
  end
end


def is_hexagonal(x) # Hn=n(2n−1)
  range = [0, 500000]
  while true
    test = (range[0] + range[1])/2
    if (test * ((2*test) -1)) == x #found the hex number
      return true
    elsif (test * ((2*test) -1)) > x
      range[1] = test
    else
      range[0] = test
    end
    if range[1] - range[0] <= 1
      return false
    end
  end
end

def hexagonal_num_gen(n)
 (n * ((2*n) -1))
end

def pentagonal_num_gen(n)
  (n * ((3*n) -1)/2)
end

def same_digits(i,j,k)  #checks if the 3, 4 digit numbers have the same digits
  i, j, k =  i.to_s.chars.sort, j.to_s.chars.sort, k.to_s.chars.sort
  if i[0] == j[0] && i[0] == k[0]
    if i[1] == j[1] && i[1] == k[1]
      if i[2] == j[2] && i[2] == k[2]
        if i[3] == j[3] && i[3] == k[3]
          return true
        end
      end
    end
  end
  false
end

def same_digits_6numbers?(i,j,k,l,m,n)  #checks if the 3, 4 digit numbers have the same digits
  i, j, k, l, m, n =  i.to_s.chars.sort, j.to_s.chars.sort, k.to_s.chars.sort, l.to_s.chars.sort, m.to_s.chars.sort, n.to_s.chars.sort
  unless i.length == j.length && i.length == k.length && i.length == l.length && i.length == m.length && i.length == n.length
    return false
  end
  case i.length
  when 2
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        return true
      end
    end
  when 3
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          return true
        end
      end
    end
  when 4
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            return true
          end
        end
      end
    end
  when 5
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[4] == j[4] && i[4] == k[4] && i[4] == l[4] && i[4] == m[4] && i[4] == n[4]
              return true
            end
          end
        end
      end
    end
  when 6
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[4] == j[4] && i[4] == k[4] && i[4] == l[4] && i[4] == m[4] && i[4] == n[4]
              if  i[5] == j[5] && i[5] == k[5] && i[5] == l[5] && i[5] == m[5] && i[5] == n[5]
                return true
              end
            end
          end
        end
      end
    end
  when 7
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[4] == j[4] && i[4] == k[4] && i[4] == l[4] && i[4] == m[4] && i[4] == n[4]
              if  i[5] == j[5] && i[5] == k[5] && i[5] == l[5] && i[5] == m[5] && i[5] == n[5]
                if  i[6] == j[6] && i[6] == k[6] && i[6] == l[6] && i[6] == m[6] && i[6] == n[6]
                  return true
                end
              end
            end
          end
        end
      end
    end
  when 8
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[4] == j[4] && i[4] == k[4] && i[4] == l[4] && i[4] == m[4] && i[4] == n[4]
              if  i[5] == j[5] && i[5] == k[5] && i[5] == l[5] && i[5] == m[5] && i[5] == n[5]
                if  i[6] == j[6] && i[6] == k[6] && i[6] == l[6] && i[6] == m[6] && i[6] == n[6]
                  if  i[7] == j[7] && i[7] == k[7] && i[7] == l[7] && i[7] == m[7] && i[7] == n[7]
                    return true
                  end
                end
              end
            end
          end
        end
      end
    end
  when 9
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[4] == j[4] && i[4] == k[4] && i[4] == l[4] && i[4] == m[4] && i[4] == n[4]
              if  i[5] == j[5] && i[5] == k[5] && i[5] == l[5] && i[5] == m[5] && i[5] == n[5]
                if  i[6] == j[6] && i[6] == k[6] && i[6] == l[6] && i[6] == m[6] && i[6] == n[6]
                  if  i[7] == j[7] && i[7] == k[7] && i[7] == l[7] && i[7] == m[7] && i[7] == n[7]
                    if  i[8] == j[8] && i[8] == k[8] && i[8] == l[8] && i[8] == m[8] && i[8] == n[8]
                      return true
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  when 10
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[4] == j[4] && i[4] == k[4] && i[4] == l[4] && i[4] == m[4] && i[4] == n[4]
              if  i[5] == j[5] && i[5] == k[5] && i[5] == l[5] && i[5] == m[5] && i[5] == n[5]
                if  i[6] == j[6] && i[6] == k[6] && i[6] == l[6] && i[6] == m[6] && i[6] == n[6]
                  if  i[7] == j[7] && i[7] == k[7] && i[7] == l[7] && i[7] == m[7] && i[7] == n[7]
                    if  i[8] == j[8] && i[8] == k[8] && i[8] == l[8] && i[8] == m[8] && i[8] == n[8]
                      if  i[9] == j[9] && i[9] == k[9] && i[9] == l[9] && i[9] == m[9] && i[9] == n[9]
                        return true
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  when 11
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
              if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                  if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                    if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                      if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                        if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                          return true
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  when 12
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
              if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                  if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                    if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                      if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                        if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                            return true
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  when 13
    if  i[0] == j[0] && i[0] == k[0] && i[0] == l[0] && i[0] == m[0] && i[0] == n[0]
      if  i[1] == j[1] && i[1] == k[1] && i[1] == l[1] && i[1] == m[1] && i[1] == n[1]
        if  i[2] == j[2] && i[2] == k[2] && i[2] == l[2] && i[2] == m[2] && i[2] == n[2]
          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
            if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
              if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                  if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                    if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                      if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                        if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                          if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                            if  i[3] == j[3] && i[3] == k[3] && i[3] == l[3] && i[3] == m[3] && i[3] == n[3]
                              return true
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  when 14
  return "need more "
  end
  false
end

def digital_sum(n)
  n = n.to_s.chars
  n.length.times {|i| n << n.shift.to_i}
  n.reduce(:+)
end

def fib(n) #returns the nth fibinacci number
  num = 0
  num_next = 1
  n.times do |i|
    num, num_next = num_next, num + num_next
  end
  num
end

def compare_poker_hands(hand1, hand2) #take in two strings of 5 cards represented by 1-9,j-a/SHDC ie: 3H KD etc.
  if what_is_hand(hand1)[0] > what_is_hand(hand2)[0]
    return true
  elsif what_is_hand(hand1)[0] < what_is_hand(hand2)[0]
    return false
  else
    if what_is_hand(hand1)[1] > what_is_hand(hand2)[1]
      return true
    elsif what_is_hand(hand1)[1] < what_is_hand(hand2)[1]
      return false
    else
      if what_is_hand(hand1)[2] > what_is_hand(hand2)[2]
        return true
      elsif what_is_hand(hand1)[2] < what_is_hand(hand2)[2]
        return false
      else
        if what_is_hand(hand1)[3] > what_is_hand(hand2)[3]
          return true
        elsif what_is_hand(hand1)[3] < what_is_hand(hand2)[3]
          return false
        else
          if what_is_hand(hand1)[4] > what_is_hand(hand2)[4]
            return true
          elsif what_is_hand(hand1)[4] < what_is_hand(hand2)[4]
            return false
          end
        end
      end
    end
  end
end

def what_is_hand(cards) # 
  card1 = cards[0..1].chars
  card2 = cards[3..4].chars
  card3 = cards[6..7].chars
  card4 = cards[9..10].chars
  card5 = cards[12..13].chars
  card_nums = []
  card_nums << @card_map[card1[0]] << @card_map[card2[0]] << @card_map[card3[0]] << @card_map[card4[0]] << @card_map[card5[0]]
  card_nums.sort!  # an array of the number value of the cards in a row
  count = Hash.new 0
  card_nums.each do |card|
    count[card] += 1
  end  #hash count now has the card_value as key, and number of them in hand as the value
  if (card_nums[0]+1 == card_nums[1]) && (card_nums[1]+1  == card_nums[2] ) && (card_nums[2]+1  == card_nums[3])  && (card_nums[3]+1  == card_nums[4]) 
    if card1[1] == card2[1] && card2[1] == card3[1] && card3[1] == card4[1] && card4[1] == card5[1]  #straight flush
      return [9, card_nums.last, @suit_map[card1[1]]]
    end
  end
  if count.values.include? 4  #four of a kind
    four_of = (count.select {|k,v| v ==4}).keys.first
    high_card = (count.select {|k,v| v ==1}).keys.first
    return [8, four_of, high_card]
  end
  if (count.values.include? 3) && (count.values.include? 2)  #full boat
    three_of = (count.select {|k,v| v ==3}).keys.first
    return [7, three_of, 1]
  end
  if card1[1] == card2[1] && card2[1] == card3[1] && card3[1] == card4[1] && card4[1] == card5[1] #flush
    suit = @suit_map[card1[1]]
    return [6, suit, card_nums[4]]
  end
  if (card_nums[0]+1 == card_nums[1]) && (card_nums[1]+1  == card_nums[2] ) && (card_nums[2]+1  == card_nums[3])  && (card_nums[3]+1  == card_nums[4]) #straight
    return [5, card_nums[4], card_nums[3]]
  end
  if count.values.include? 3
    three_of = (count.select {|k,v| v ==3}).keys.first
    remaining_cards = card_nums.reject{|i| i == three_of}
    return [4, three_of, 1]
  end
  if ((count.select {|k,v| v ==2}).keys.length == 2)  # two pair
    pairs_of = (count.select {|k,v| v ==2}).keys.sort
    high_card = (count.select {|k,v| v ==1}).keys.first
    return [3, pairs_of[1], pairs_of[0], high_card]
  end
  if count.values.include? 2  #1 pair
    pair_of = (count.select {|k,v| v ==2}).keys.first
    remaining_cards = card_nums.reject{|i| i == pair_of}
    return [2, pair_of, remaining_cards[2], remaining_cards[1], remaining_cards[0]]
  end
  return [1, card_nums.reverse].flatten  #high card
end

def is_right_triangle(a,b,c)
  if a**2 + b**2 == c**2
    return true
  end
  false
end

