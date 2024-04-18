croatia_alphabet = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z=']

word = input()

count = 0
for i in croatia_alphabet:
    count += word.count(i)


count += len(word) - 2*count
print(count)