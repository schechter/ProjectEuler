require 'pry'
require 'ruby-prof'
require_relative 'project_euler_helpers'
require_relative 'project_euler_inputs'


def prob1
  to_sum= []
  for i in (0...1000)
    if i % 3 == 0
      to_sum.push i
    elsif i % 5 == 0
      to_sum.push i
    end
  end
  sum = 0
  to_sum.reduce(:+)
  sum
end

def prob2 #sum of even fibinacci up to 4,000,000
  num = 0
  num_next = 1
  to_sum = []
  while num < 4000000
    num, num_next = num_next, num + num_next
    if num.even?
      to_sum.push num
    end
  end
  to_sum.reduce(:+)
end

def prob3 # largets prime factory of 600851475143
  max = 600851475143 ** 0.5
  for i in (1..max).step(2)
    if 600851475143 % i == 0 #need if prime
      if is_prime(i)
        ans = i
      end
    end
  end
  ans
end

def prob3easy
  require 'prime'
  array = Prime.prime_division(600851475143)
  answer = array[-1][0]**array[-1][1]
  answer
end

def prob4 #largest palindrome from product of 3 digit number numbers
  ans = 0
  for i in 900..999
    for j in 900..999
      candidate = i*j
      if is_palindrome(candidate.to_s.chars)
        ans = i*j
      end
    end
  end
  ans
end

def prob5 # smallest positive number evenly divisible by 1-20
  ans = 2520
  while true
    if ans % 20 == 0
      if ans % 19 == 0
        if ans % 18 == 0
          if ans % 17 == 0
            if ans % 16 == 0
              if ans % 15 == 0
                if ans % 14 == 0
                  if ans % 13 == 0
                    if ans % 12 == 0
                      if ans % 11 == 0
                        return ans
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
    ans += 20
  end
end

def prob6 #difference between the sum of squar of 1-100 and square of the sum
  squares = []
  nums_to_squares = 0
  sum_of_squared = 0
  for i in (0..100)
    squares << (i *= i)
  end
  squares.each { |i| sum_of_squared += i } #sum of squared numbers
  for i in (0..100)
    nums_to_squares += i
  end
  squared_sum = (nums_to_squares * nums_to_squares)
  ans = squared_sum - sum_of_squared
  ans
end

def prob7 # what is the 10001st prime #
  ans = 0
  num_primes = 0
  require 'prime'
  pg = Prime::Generator23.new
  while true
    test = pg.next()
    # if is_prime(test)
    if Prime.instance.prime?(test) #way faster
      num_primes +=1
      if num_primes == 10001
        return test
      end
    end
  end
end

def prob7_1 # what is the 10001st prime #
  ans = 0
  num_primes = 0
  require 'prime'
  pg = Prime.new
  while true
    test = pg.next()
    num_primes +=1
    if num_primes == 10001
      return test
    end
  end
end

def prob8 # greatest product of 5 consecutive #'s in these
  list = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450
  highest = 0
  list = list.to_s.chars
  list.length.times { |i| list[i] = list[i].to_i }
  for i in (0..(list.length-5))
    current = (list[i] * list[i + 1] * list[i + 2] * list[i + 3] * list[i + 4])
    if current > highest
      highest = current
    end
  end
  highest
end

def prob9 # product of a,b,c where a,b,c are pythagotean tripplet which a+b+c = 1000
  for a in (200..400)
    for b in (200..400)
      c = (1000 - a - b)
      if (a*a + b*b) == c*c
        return (a*b*c)
      end
    end
  end
  p 'ended without answer'
end

def prob10 # sum of all prime #'s below 2,000,000
  require 'prime'
  total = 0
  pg = Prime::Generator23.new
  while true
    test = pg.next()
    if Prime.instance.prime?(test)
      if test > 2000000
        break
      else
        total += test
      end
    end
  end
  total
end

def prob11(grid)
  ans = [check_rows(grid), check_columns(grid), check_diagonals(grid)].max
end

def prob12 #What is the value of the first triangle number to have over five hundred divisors?
  n = 1000
  divisors = 0
  while divisors < 500
    divisors = divisor_counter(triangle_num_gen(n))
    n +=1
    # if n % 100 == 0
    #   p "trangle number #{n} is: #{triangle_num_gen(n)} founds @ #{Time.now}"
    # end
  end
  n -= 1
  triangle_num_gen(n)
end

def prob13(nums) # Work out the first ten digits of the sum of the following one-hundred 50-digit numbers
  ans = 0
  nums.each do |n|
    ans += n
  end
  ans
end

def prob14 #Which starting number, under one million, produces the longest chain?
  largest_chain = 0
  for i in (800000..1000000)
    if collatz_sequence(i) > largest_chain
      largest_chain = collatz_sequence(i)
      ans = i
    end
  end
  ans
end

def prob15(start, grid_size, num_paths)
  @num_paths = num_paths
  if @problem15_knowns.keys.include? start
    @num_paths += @problem15_knowns[start]
    return @num_paths
  else
    if start[0] == grid_size && start[1] == grid_size
      @num_paths +=1
      return @num_paths
    end
    if start[0] == grid_size
      prob15([start[0], start[1]+1], grid_size, @num_paths)
    elsif start[1] == grid_size
      prob15([start[0]+1, start[1]], grid_size, @num_paths)
    else
      prob15([start[0], start[1]+1], grid_size, @num_paths)
      prob15([start[0]+1, start[1]], grid_size, @num_paths)
    end
  end
end

def prob16 # What is the sum of the digits of the number 2^1000?
  ans = 0
  big_num = 2**1000
  big_string = big_num.to_s.chars
  big_string.each do |num|
    ans += num.to_i
  end
  ans
end

def prob17 # If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
  one_ninetynine = []
  one_9 = [3,3,5,4,4,3,5,5,4]
  ten = [3]
  eleven_nineteen = [6,6, 8, 8, 7, 7, 9, 8, 8]
  twenty_ninty = [6, 6, 5, 5, 5, 7, 6, 6]
  one_ninetynine << (one_9 * 9) << ten << eleven_nineteen << (twenty_ninty * 10)
  hundred = [7]
  and_ = [3]
  onethousand = [11]
  one_to_onethousand = (one_ninetynine * 10) + (hundred * 900) + (one_9 * 100) + onethousand + (and_ * 891)
  one_to_onethousand.flatten.reduce(:+)
end

def prob18  #paths through triangle, need to work out the better way.
  answers = prob18recursion(@problem_18_triangle, [0,0], [], nil)
  answers_cleaned = []
  # p answers
  answers.last.each do |num|
    if num.class == Fixnum
      answers_cleaned << num
    end
  end
  answers_cleaned.max
  # answers.max
end

def prob19 #How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
  # mon = 1, sunday = 7
  # jan 1 1901 was a tuesday
  total_sundays = 0
  current_first_day = 2
  year = 1901
  while year < 2001
    if year % 4 == 0 #leap year
      if year % 400 == 0 # leap year-nonleap year
        @months.each do |k, v|
          total_sundays += is_sunday(current_first_day)
          current_first_day += v
        end
        year +=1
      else
        @months.each do |k, v|
          unless k == 'feb'
            total_sundays += is_sunday(current_first_day)
            current_first_day += v
          else
            total_sundays += is_sunday(current_first_day)
            current_first_day += v+1
          end
        end
        year +=1
      end
    else #non leap year
      @months.each do |k, v|
        total_sundays += is_sunday(current_first_day)
        current_first_day += v
      end
      year +=1
    end
  end
  total_sundays
end

def prob20
  ans = 0
  big_num = (1..100).reduce(:*)
  list = big_num.to_s.chars
  list.length.times { |i| list[i] = list[i].to_i }
  list.each {|n| ans+=n}
  ans
end

def prob21
  amicable_numbers = []
  for i in (1..10000)
    unless amicable_numbers.include? i
      amicable_numbers << is_amicable(i)
      amicable_numbers.flatten!
    end
  end
  amicable_numbers.reduce(:+)
end

def prob22(names)
  names = names.sort
  total_score = 0
  name_number = 0
  names.each do |name|
    name_number +=1
    name_score = 0
    name.downcase.each_char do |l|
      name_score += @letters[l]
    end
    total_score += (name_score * name_number)
  end
  total_score
end

def prob23 # Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
  new_array = []
  for i in (0..@abundant_numbers_under28123.length - 1)
    for j in (0..@abundant_numbers_under28123.length - i - 1)
      new_array << @abundant_numbers_under28123[i] + @abundant_numbers_under28123[j+i]
    end
  end
  new_array = new_array.uniq
  sum = 0
  for i in (0..28124)
    unless new_array.include? i
      sum += i
    end
  end
  sum
end

def prob24 #What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
  a = '0123456789'.chars.to_a.permutation.map &:join
  a[999999]
end

def prob25 #What is the first term in the Fibonacci sequence to contain 1000 digits?
  term = 0
  num = 0
  num_next = 1
  while true
    term +=1
    num, num_next = num_next, num + num_next
    if num.to_s.chars.length >= 1000
      return term
    end
  end
end

def prob27 #Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0. n² + an + b, where |a| < 1000 and |b| < 1000
  require 'prime'
  highest = 0
  highest_a_b = 0,0
  for a in (-1000..1000)
    for b in (-1000..1000)
      current_num_of_primes = 0
      n = 0
      test = 3
      while Prime.prime?(test)
        test = (n**2) + (n * a) + b
        n +=1
        current_num_of_primes +=1
        if current_num_of_primes > highest
          highest = current_num_of_primes
          highest_a_b = a, b
        end
      end
    end
  end
  highest_a_b[0] * highest_a_b[1]
end

def prob28(build_to) #What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
  current_num_between_corners = 2
  last_completed_corner = 1
  sum = 1
  corners_found_this_layer = 0
  for i in (2..build_to*build_to)
    if (i-last_completed_corner) % current_num_between_corners == 0
      sum += i
      corners_found_this_layer +=1
    end
    if corners_found_this_layer == 4
      corners_found_this_layer = 0
      current_num_between_corners +=2
      last_completed_corner = i
    end
  end
  sum
end

def prob29 # How many distinct terms are in the sequence generated by a**b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
  all_terms = []
  for a in (2..100)
    for b in (2..100)
      all_terms << a**b
    end
  end
  distinct_terms = all_terms.uniq
  distinct_terms.length
end

def prob30 #Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
  qualified_nums = []
  for a in (0..9)
    for b in (0..9)
      for c in (0..9)
        for d in (0..9)
          test = (a**5 + b**5 + c**5 + d**5)
          testarray = test.to_s.chars
          string_a, string_b, string_c, string_d = a.to_s, b.to_s, c.to_s, d.to_s
          if testarray.include? string_a
            testarray.slice!(testarray.index(string_a))
            if testarray.include? string_b
              testarray.slice!(testarray.index(string_b))
              if testarray.include? string_c
                testarray.slice!(testarray.index(string_c))
                if testarray.include? string_d
                  testarray.slice!(testarray.index(string_d))
                  if testarray.length == 0
                    qualified_nums << test
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  for a in (0..9)
    for b in (0..9)
      for c in (0..9)
        for d in (0..9)
          for e in (0..9)
            test = (a**5 + b**5 + c**5 + d**5 + e**5)
            testarray = test.to_s.chars
            string_a, string_b, string_c, string_d, string_e = a.to_s, b.to_s, c.to_s, d.to_s, e.to_s
            if testarray.include? string_a
              testarray.slice!(testarray.index(string_a))
              if testarray.include? string_b
                testarray.slice!(testarray.index(string_b))
                if testarray.include? string_c
                  testarray.slice!(testarray.index(string_c))
                  if testarray.include? string_d
                    testarray.slice!(testarray.index(string_d))
                    if testarray.include? string_e
                      testarray.slice!(testarray.index(string_e))
                      if testarray.length == 0
                        qualified_nums << test
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
  for a in (0..9)
    for b in (0..9)
      for c in (0..9)
        for d in (0..9)
          for e in (0..9)
            for f in (0..9)
              test = (a**5 + b**5 + c**5 + d**5 + e**5 + f**5)
              testarray = test.to_s.chars
              string_a, string_b, string_c, string_d, string_e, string_f = a.to_s, b.to_s, c.to_s, d.to_s, e.to_s, f.to_s
              if testarray.include? string_a
                testarray.slice!(testarray.index(string_a))
                if testarray.include? string_b
                  testarray.slice!(testarray.index(string_b))
                  if testarray.include? string_c
                    testarray.slice!(testarray.index(string_c))
                    if testarray.include? string_d
                      testarray.slice!(testarray.index(string_d))
                      if testarray.include? string_e
                        testarray.slice!(testarray.index(string_e))
                        if testarray.include? string_f
                          testarray.slice!(testarray.index(string_f))
                          if testarray.length == 0
                            qualified_nums << test
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
  qualified_nums.uniq.reduce(:+)
end

def prob32 #Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
  to_sum = []
  for i in (4..50)
    for j in (150..2000)
      if is_pandigital(i, j, i*j)
        to_sum << i*j
      end
    end
  end
  p to_sum.sort
  to_sum.uniq.reduce(:+)
end

def prob34 #Find the sum of all numbers which are equal to the sum of the factorial of their digits.
  to_sum = []
  for i in (9..50000)
    sum_of_digits_fact = 0
    digits = i.to_s.chars
    digits.each do |d|
      # sum_of_digits_fact += factorial(d.to_i)
      sum_of_digits_fact += @factorials1_9[d]
    end
    if i == sum_of_digits_fact
      to_sum << i
    end
  end
  to_sum.reduce(:+)
end

def prob35 # How many circular primes are there below one million?
  num_of_circular_primes = 0
  require 'prime'
  Prime.each do |test|
    if  test < 1000000
      if test < 10
        num_of_circular_primes +=1
      end
      if is_circular_prime(test.to_s.chars)
        num_of_circular_primes +=1
      end
    else
      break
    end
  end
  num_of_circular_primes -4
end

def prob36 #Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
  ans = 0
  for i in (1..1000000)
    if is_palindrome(i.to_s.chars) && is_palindrome(i.to_s(2).chars)
      ans += i
    end
  end
  ans
end

def prob37  #Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
  require 'prime'
  found = 0
  sum = 0
  n = Prime::Generator23.new
  4.times {|i|  n.next}
  prime_number = n.next
  while found != 11
    if Prime.instance.prime?(prime_number)
      if is_truncatable(prime_number)
        found += 1
        p "have found #{found} of the 11 with #{prime_number}"
        sum += prime_number
      end
    end
    prime_number = n.next
  end
  sum
end

def prob38 # What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
  candidates = []
  for i in (1..9999)# multiplied by 1-2
    if is_pandigital_array((i*1).to_s.chars + (i*2).to_s.chars)
      candidates << ((i*1).to_s.chars + (i*2).to_s.chars).join.to_i
      p i
    end
  end
  candidates.max
end

def prob39 #For which value of p ≤ 1000, is the number of solutions maximised?
  max = [0,0]  #array storing p, and the number of soutions
  for i in (0..1000).step(20)
    solutions = 0
    for j in (1..i/2)
      for k in (j..i/2)
        l = (j**2 + k**2)**0.5
        if i < j+k+l
          break
        end
        if i == j+k+l
          solutions +=1
        end
      end
    end
    if solutions > max[0]
      max[0] = solutions
      max[1] = i
    end
  end
  max[1]
end

def prob40  #d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000  of 0.123456789101112 etc.
  numbers= ''
  start = 1
  while numbers.size < 1000000
    numbers += start.to_s
    start +=1
  end
  num_array = numbers.to_s.chars
  num_array[0].to_i * num_array[99].to_i * num_array[999].to_i * num_array[9999].to_i * num_array[99999].to_i * num_array[999999].to_i
end

def prob41 #What is the largest n-digit pandigital prime that exists?
  require 'prime'
  ans = 0
  7654322.downto(0) do |num|
    if is_pandigital_n(num)
      if Prime.prime?(num)
        return num
      end
    end
  end
end

def prob42(words)  #how many are triangle words?
  ans = 0
  words.each do |word|
    word_score = 0
    letters = word.downcase.chars
    letters.each do |letter|
      word_score += @letters[letter]
    end
    if @first_30_triangle_num.include? word_score
      ans+=1
    end
  end
  ans
end

def prob43 # d2d3d4=406 is divisible by 2 d3d4d5=063 is divisible by 3 d4d5d6=635 is divisible by 5 d5d6d7=357 is divisible by 7 d6d7d8=572 is divisible by 11 d7d8d9=728 is divisible by 13 d8d9d10=289 is divisible by 17 Find the sum of all 0 to 9 pandigital numbers with this property.
  a_nums,b_nums,c_nums,d_nums,e_nums,f_nums, g_nums, candidates = [],[],[],[],[],[],[],[]
  for i in (12..987)
    if i % 2 == 0 # d2d3d4 is divisible by 2
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        a_nums << j
      end
    end
    if i % 3 == 0  # d3d4d5 is divisible by 3
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        b_nums << j
      end
    end
    if i % 5 == 0 # d4d5d6 is divisible by 5
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        c_nums << j
      end
    end
    if i % 7 == 0  # d5d6d7 is divisible by 7
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        d_nums << j
      end
    end
    if i % 11 == 0  # d6d7d8 is divisible by 11
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        e_nums << j
      end
    end
    if i % 13 == 0 # d7d8d9 is divisible by 13
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        f_nums << j
      end
    end
    if i % 17 == 0 # d8d9d10 is divisible by 17
      i.to_s.chars.length == 2 ? (j = i.to_s.chars.unshift '0') :  (j = i.to_s.chars)
      if j.uniq.length == 3
        g_nums << j
      end
    end
  end
  a_nums.each do |a|
    b_nums.each do |b|
      if a[1] == b[0] && a[2] == b[1]
        c_nums.each do |c|
          if b[1] == c[0] && b[2] == c[1]
            d_nums.each do |d|
              if c[1] == d[0] && c[2] == d[1]
                e_nums.each do |e|
                  if d[1] == e[0] && d[2] == e[1]
                    f_nums.each do |f|
                      if e[1] == f[0] && e[2] == f[1]
                        g_nums.each do |g|
                          if f[1] == g[0] && f[2] == g[1]
                            candidates << [a, d, g].flatten if [a,d,g].flatten.include? '0'
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
  numbers = candidates.select {|i| i.uniq.length == 9 }
  numbers.each do |number|
    for i in (1..9)
      unless number.include? i.to_s
        number.unshift i.to_s
      end
    end
  end
  sum = 0
  numbers.each do |number|
    sum += number.join.to_i
  end
  sum
end

def prob44  # Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?
  for i in (1..1999)
    for j in ((i+1)..3000)
      difference = (@first_10000_pentagonal_numbers[j]-@first_10000_pentagonal_numbers[i]).abs
      sum = @first_10000_pentagonal_numbers[j]+@first_10000_pentagonal_numbers[i]
      if @is_pantagonal_hash[difference]
        if @is_pantagonal_hash[sum]
          return difference
        end
      end
    end
  end
end

def prob45 #It can be verified that T285 = P165 = H143 = 40755. Find the next triangle number that is also pentagonal and hexagonal.
  i = 286 #
  while true
    j = triangle_num_gen(i)
    if  is_pentagonal(j) && is_hexagonal(j)  # there are more hexagonal matches so this order shaves off 10+ seconds about 1/3rd
      return "#{j} is the #{i}th traingle number"
    end
    i +=1
  end
end

def prob48
  ans = 0
  for i in (1..1000)
    ans += i**i
  end
  ans
end

def prob49 #There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.  What 12-digit number do you form by concatenating the three terms in this sequence?
  require 'prime'
  for i in (1000..9950)
    k, l = i+3330, i+6660
    unless i == 1487
      if same_digits(i,k,l) && Prime.prime?(i) && Prime.prime?(k) && Prime.prime?(k)
        p "found one with #{i}, #{k}, and #{l}"
      end
    end
  end
end

def prob52 #Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
  i = 100
  while true
    if same_digits_6numbers?(i, i*2, i*3, i*4, i*5, i*6)
      return i
    end
    i+=1
  end
end

def prob53 #How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?
  facts = {}
  for i in (0..100)
    facts[i] = factorial(i)
  end
  solutions = 0
  for i in (1..100)
    for j in (1..i)
      if (facts[i]/(facts[j]*facts[i-j])) >1000000
        solutions +=1
      end
    end
  end
  solutions
end

def prob54
  num_player_1_wins = 0
  File.open('problem54_poker_hands.txt', 'r') do |f1|
    f1.each do |line|
      if compare_poker_hands(line[0..13], line[15..28])
        num_player_1_wins +=1
      end
    end
  end
  num_player_1_wins
end

def prob55
  ans = 0
  for i in (1..10000)
    iteration = 1
    num = i
    while true
      j = num + num.to_s.reverse.to_i
      if is_palindrome(j.to_s.chars)
        break
      else
        iteration +=1
        num = j
      end
      if iteration == 55
        ans +=1
        break
      end
    end
  end
  ans
end

def prob56
  max = 0
  for i in (1..100)
    for j in (1..100)
      k = digital_sum(i**j)
      if k > max
        max = k
      end
    end
  end
  max
end

def prob58 #what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?
  require 'prime'
  numerator, denominator = 0.0,1.0
  current_num_between_corners = 2
  i = 1
  while true
    4.times do |j|
      i += current_num_between_corners
      unless j == 3
        numerator +=1 if i.prime?
      end
    end
    current_num_between_corners +=2
    denominator += 4
    if numerator/denominator < 0.10
      return current_num_between_corners -1
    end
  end
end

def prob59
  number_of_spaces = 0
  best_key = nil
  possible_codes = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'].combination(3)
  possible_codes.each do |code|  #apply each code possibility to the array of numbers.  test for which one has the word 'the' the most times?  
    key = code*401
    translation = []
    for i in (0..1200)
      translation << ((key[i].ord)^@problem59_cypher[i]).chr
    end
    if translation.join.include?(' a ') > number_of_spaces
      number_of_spaces = translation.count(' ')
      best_key = key
    end
  end
  for i in (0..1200)
    print ((best_key[i].ord)^@problem59_cypher[i]).chr
  end
end

def prob63 # How many n-digit positive integers exist which are also an nth power?
  ans = 0
  for i in (1..9)
    j = 1
    while true
      if (i**j).to_s.length == j
        ans +=1
      else
        break
      end
      j +=1
    end
  end
  ans
end

def prob69 # Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.
  require 'prime'
  @divisors ={1=>[]}
  ans = 0
  @max_value = 0
  for i in (2..1_000_000).step(2)
    p i
    num_relative_primes = relatively_prime_counter(i)
    value = i.to_f/num_relative_primes
    if value > @max_value
      @max_value = value
      ans = i
    end
  end
  ans
end


def prob74 #How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?  Brute force.  When I saw  249273 249327 249372 249723 249732 272349 272394 272439 272493 272934 ..., I aware that I did a lot of stupid things...Brute force is bad, but I still keep my programming running :p
  ans = 42
  for i in (200000..1000000)
    if how_many_terms(i) == 60
      ans +=1
    end
  end
  ans
end

def prob81(start, path_value)
  if start == [0,0]
    return path_value
  end
  if start[0] == 0
     prob81([start[0],start[1]-1],path_value+@problem81_matrix[start[0]][start[1]-1])
  elsif start[1] ==0
    prob81([start[0]-1,start[1]],path_value+@problem81_matrix[start[0]-1][start[1]]) 
  else
    # binding.pry
    if @problem81_matrix[start[0]-1][start[1]] < @problem81_matrix[start[0]][start[1]-1]
      p @problem81_matrix[start[0]-1][start[1]]
      prob81([start[0]-1,start[1]],path_value+@problem81_matrix[start[0]-1][start[1]]) # go left
    else
      p @problem81_matrix[start[0]][start[1]-1]
      prob81([start[0],start[1]-1],path_value+@problem81_matrix[start[0]][start[1]-1]) # got up
    end
  end
end

def prob102
  triangles_with_origin = 0
  File.open('problem102_triangles.txt', 'r') do |f1|
    f1.each do |line|
      t = line.chomp.split(',').map { |n| n.to_i  }
      a = t[0..1]
      b = t[2..3]
      c = t[4..5]
      if origin_in_triangle(a,b,c)
        triangles_with_origin +=1
      end
    end
  end
  triangles_with_origin
end
    
def prob104
  term = 0
  num = 0
  num_next = 1
  while true
    term += 1
    num, num_next = num_next, num + num_next
    test = num.to_s.chars
    first_9 = test[0..8]
    last_9 = test[-9..-1]
    if last_9
      if  is_pandigital_array(last_9) && is_pandigital_array(first_9)
        p "F(#{term}), #{num} is the answe?"
        return term
      end
    end
    if term % 1000 == 0
      p " At the #{term}th Fibinacci number"
    end
  end
end

def prob112
  bouncy_numbers = 0
  current_number = 99
  while true
    if is_bouncy_number(current_number)
      bouncy_numbers += 1
    end
    ratio = bouncy_numbers.to_f / current_number
    if ratio == 0.99
      return current_number
    end
    current_number +=1
  end
end

def prob113
  non_bouncy = 0
  for i in (1..(10**100))  # yea ringht!!!
    unless is_bouncy_number(i)
      p non_bouncy += 1
    end
  end
  non_bouncy
end


def prob119 #You are given that a2 = 512 and a10 = 614656.  Find a30   5 + 1 + 2 = 8, and 83 = 512. Another example of a number with this property is 614656 = 284.
  test = 10
  a_of = 0
  while a_of < 30
    result = 0
    digit_sum = digital_sum(test)
    exponent = 1
    unless digit_sum == 1
      while result < test
        result = digit_sum**exponent
        if result == test
          a_of +=1
          p "found a(#{a_of}) with #{test} whose digital sum is #{digit_sum} and exponent was #{exponent}."
        end
        exponent +=1
      end
    end
    test += 1
  end
  test
end

def prob119_1  ##You are given that a2 = 512 and a10 = 614656.  Find a30   5 + 1 + 2 = 8, and 83 = 512. Another example of a number with this property is 614656 = 284.   way better than one above!  0.22 seconds not days...
  results = []
  for i in (2..75)
    for j in (2..9)
      if digital_sum(i**j) == i
        results << i**j
      end
    end
  end
  results.sort[29]
end

def prob179 #Find the number of integers 1 < n < 10**7, for which n and n + 1 have the same number of positive divisors. For example, 14 has the positive divisors 1, 2, 7, 14 while 15 has 1, 3, 5, 15.
  ans = 0  # 9825000 there are 969425 consecutive divisors
  last_divisor_count = 0
  for i in (2..10**7-1)
    if i % 75000 == 0
      p "At #{i} there are #{ans} consecutive divisors  @#{Time.now}"
    end
    current_divisor_count = divisor_counter(i)
    if current_divisor_count == last_divisor_count
      ans +=1
    end
    last_divisor_count = current_divisor_count
  end
  ans
end




RubyProf.start
# print 'Starting Problem 1: '
# p prob1
# print 'Starting Problem 2: '
# p prob2
# print 'Starting Problem 3: '
# p prob3
# print 'Starting Problem 4: '
# p prob4
# print 'Starting Problem 5: '
# p prob5
# print 'Starting Problem 6: '
# p prob6
# print 'Starting Problem 7: '
# p prob7
# print 'Starting Problem 7.1: '
# p prob7_1
# print 'Starting Problem 8: '
# p prob8
# print 'Starting Problem 9: '
# p prob9
# print 'Starting Problem 10: '
# p prob10
# print 'Starting Problem 11: '
# p prob11(@prob11_grid)
# print 'Starting Problem 12: '
# p prob12
# print 'Starting Problem 13: '
# p prob13(@problem_13_numbers)
# print 'Starting Problem 14: '
# p prob14
# print 'Starting Problem 15: '  #need to make it smarter
# p solve_15
# print 'Starting Problem 16: '
# p prob16
# print 'Starting Problem 17: '
# p prob17
# print 'Starting Problem 18: '
# p prob18
# print 'Starting Problem 19: '
# p prob19
# print 'Starting Problem 20: '
# p prob20
# print 'starting problem 21'
# p prob21
# print 'starting problem 22'
# p prob22(@problem22_names)
# print 'starting problem 23'
# p prob23
# print 'starting problem 24'
# p prob24
# print 'starting problem 25: '
# p prob25
# print 'starting problem 27'
# p prob27
# print 'starting problem 28: '
# p prob28(1001)
# print 'starting problem 29'
# prob29
# print 'starting problem 30: '
# p prob30
# print 'starting problem 32: '
# p prob32
# print 'starting problem 34: '
# p prob34
# print "starting problem 35: "
# p prob35
# print "starting problem 36: "
# p prob36
# print "starting problem 37: "
# p prob37
# print "starting problem 38: "
# p prob38
# print "starting problem 39: "
# p prob39
# print 'starting problem 40: '
# p prob40
# print 'starting problem 41: '
# p prob41
# print 'starting problem 42: '
# p prob42(@problem42_words)
# print 'starting problem 43: '
# p prob43
# print 'starting problem 44: '
# p prob44
# print 'starting problem 45: '
# p prob45
# print 'starting problem 48: '
# p prob48
# print 'starting problem 49: '
# p prob49
# print 'starting problem 52: '
# p prob52
# print 'starting problem 53: '
# p prob53
# print 'starting problem 54: '
# p prob54
# print 'starting problem 55: '
# p prob55
# print 'starting problem 56: '
# p prob56
# print 'starting problem 58: '
# p prob58
# print 'starting problem 59: '
# p prob59
# print 'starting problem 63: '
# p prob63
# print 'starting problem 69: '
# p prob69
# print 'starting problem 74: '
# p prob74
# print 'starting problem 81: '
# p prob81([79,79],7981)
# print 'starting problem 104: '
# p prob104
# print 'starting problem 102: '
# p prob102
# print 'starting problem 112: '
# p prob112
print 'starting problem 113: '
p prob113
# print 'starting problem 119: '
# p prob119_1
# print 'starting problem 179'
# p prob179
result = RubyProf.stop





# Print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
