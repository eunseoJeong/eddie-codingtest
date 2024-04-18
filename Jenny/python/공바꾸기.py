# n개 바구니
# m번 공 바꾸기
# i, j 번 바구니 공 교환
n,m = map(int,input().split())
balls_bucket = [i+1 for i in range(n)]
for _ in range(m):
    i,j = map(int,input().split())
    i_ball = balls_bucket[i-1]
    j_ball = balls_bucket[j-1]
    balls_bucket[i-1]= j_ball
    balls_bucket[j-1]= i_ball

print(*balls_bucket)