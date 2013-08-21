require 'pry'
require 'ruby-prof'
require_relative 'project_euler_helpers'
require_relative 'project_euler_inputs'
RubyProf.start

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

def prob15(start, grid_size, num_paths, itterations)
  @num_paths = num_paths
  @itterations = itterations
  if @itterations == 0  # Only need to check half the routes.
    @itterations += 1
    prob15([start[0], start[1]+1], grid_size, @num_paths, @itterations)
  else
    if start[0] == grid_size && start[1] == grid_size
      @num_paths +=1
      return start, @num_paths
    end
    if start[0] == grid_size
      prob15([start[0], start[1]+1], grid_size, @num_paths, @itterations)
    elsif start[1] == grid_size
      prob15([start[0]+1, start[1]], grid_size, @num_paths, @itterations)
    else
      prob15([start[0], start[1]+1], grid_size, @num_paths, @itterations)
      prob15([start[0]+1, start[1]], grid_size, @num_paths, @itterations)
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

def prob40  #d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000  of 0.123456789101112 etc.
  numbers= ''
  start = 1
  while numbers.size < 1000000
    numbers += start.to_s
    start +=1
  end
  num_array = numbers.to_s.chars
  p num_array[0]
  p num_array[9]
  p num_array[99]
  p num_array[999]
  p num_array[9999]
  p num_array[99999]
  p num_array[999999]
  num_array[0].to_i * num_array[99].to_i * num_array[999].to_i * num_array[9999].to_i * num_array[99999].to_i * num_array[999999].to_i
end

def prob41 #What is the largest n-digit pandigital prime that exists?
  require 'prime'
  n = Prime::Generator23.new
  3000000.times {|i| n.next}
  num = n.next
  p " Starting @ #{num}"
  ans = 0
  while num < 987654322
    if is_pandigital_n(num)
      ans = num
      p "Found #{ans}"
    end
    num = n.next
  end
  ans
end

def prob42(words)  #how many are triangle words?
  ans = 0
  words.each do |word|
    word_score = 0
    letters = word.downcase.chars
    letters.each do |letter|
      word_score += @letters[letter]
    end
    if word_score > 465
      p "#{word} has a score of #{word_score}, that's too high"
    end
    if @first_30_triangle_num.include? word_score
      ans+=1
    end
  end
  ans
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
  i = 10
  while true
    if same_digits_6numbers?(i, i*2, i*3, i*4, i*5, i*6)
      return i
    end
    i+=1
  end
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

def prob179 #Find the number of integers 1 < n < 10**7, for which n and n + 1 have the same number of positive divisors. For example, 14 has the positive divisors 1, 2, 7, 14 while 15 has 1, 3, 5, 15.
  ans = 0  # At 8625000 there are 852656 consecutive divisors
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
# p Time.now
# p prob15([0,0], 14, 0, 0)
# p Time.now
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
# print 'starting problem 25: '
# p prob25
# print 'starting problem 27'
# p prob27
# print 'starting problem 29'
# prob29
# print 'starting problem 30: '
# p prob30
# print 'starting problem 32: '
# p prob32
# print 'starting problem 34: '
# p prob34
# print 'starting problem 40: '
# p prob40
# print 'starting problem 41: '
# p prob41
# print 'starting problem 42: '
# p prob42(@problem42_words)
# print 'starting problem 45: '
# p prob45
# print 'starting problem 48: '
# p prob48
# print 'starting problem 49: '
# p prob49
# print 'starting problem 52: '
# p prob52
# print 'starting problem 55: '
# p prob55
# print 'starting problem 56: '
# p prob56
# print 'starting problem 179'
# p prob179



result = RubyProf.stop
# Print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
