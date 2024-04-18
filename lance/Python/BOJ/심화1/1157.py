word = input().upper()  # MISSISSIPI
word_list = list(set(word)) # [M, I, S, P]

cnt = []
for i in word_list: # M, I, S, P
  count = word.count(i) # 1, 4, 4, 1
  cnt.append(count)

if cnt.count(max(cnt)) > 1:
  print("?")

else:
  print(word_list[(cnt.index(max(cnt)))])