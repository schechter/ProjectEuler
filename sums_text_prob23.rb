# array = [0,1,2,3,4,5,6,7,8,9]

# def get_subsets(array)
#   if array.length == 0
#     return [[]]
#   end
#   subsets = []
#   first = array.first
#   rest = array.drop(1)
#   get_subsets(rest).each do |partial_subset|
#     subsets << partial_subset
#     next_subset = partial_subset + [first]
#     subsets << next_subset
#   end
# end
# get_subsets(array)


# p "result should be ['012', '021', '102', '120', '201', '210']"
