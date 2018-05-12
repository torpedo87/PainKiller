# running time 에 영향을 끼치는 것들
- 알고리즘, 자료구조, 데이터 크기


---

#  한줄 세우기


## array 
- index 사용해서 특정 인덱스의 원소를 read 편리
- search O(n), insert delete 불편 O(n), read 편리 O(1)


## linked list 
- node(nextNode, value), headNode와 tailNode는 value 없음. List(headNode, tailNode). 
- 중간부분에 insert, delete 편리 (노드의  pointer 만 수정하면 됨)
- search O(n)


## stack
- linked list 
- but 중간부분에 insert, delete 하지 않고 오로지 맨앞의 insert(push), delete(pop) 만 고려
- Last in first out
- ex) balancing symbol (괄호 여닫기) =  open (push), close(pop)


## queue
- linked list
- but 중간부분에 insert, delete 하지 않고 맨뒤에서 insert(enqueue), 맨앞에서 delete(dequeue) 만 고려, O(1)
- First in first out
 

---

# 재귀
- 기본 조건 = 탈출구, 사이즈 크기 감소하며 자신 호출
- 풀려고 하는 큰 사이즈의 func을 먼저 call 하고 이를 위해 내부에서 작은 사이즈의 func call 함 ( = top down 방식)
- repeating problem = 동일한 func call 반복, size 감소
- ex) factorial, 최대공약수, 피보나치
- stack frame에 계속 func call 이 쌓여서 메모리 비효율적(똑같은 call을 두번 요청) -> dynamic programming 으로 해결(func call을 기록해두었다가 똑같은 call 시 사용하기)
- merge sort
- 동일한 func call을 스택에 push, pop할 때 총 두번씩 호출하므로 O(2^n)


# dynamic programming
- 재귀로 풀 수 있는 문제 중에 반복되는 sub func call이 많은 경우 메모리 문제가 발생하므로 이를 해결하기 위해 사용
- 작은 사이즈 부터 풀기 ( bottom up 방식)
- func call 결과값을  재활용하기 위해 기록해두기 (memoizatino table = 딕셔너리)
- for loop 사용
- O(n)

---

# 트리
- linked list 구조와 비슷하나 트리는 한줄이 아님
- subTree 들이 있으므로 재귀를 사용하기 편한 구조
- traversing = 모든 노드를 탐색하는 방법
- root = special node
- full tree = 노드가 꽉찬 트리
- complete tree = 왼쪽에서부터 순서대로 노드가 채워진 트리
- balanced tree = 2^h - 1 < N < = 2^(h+1) - 1,     마지막 레벨 이전레벨까지는 노드가 다 채워져 있고 마지막 레벨에는 노드가 덜 채워져 있는 상태


## binary search tree
- root 노드에서 insert, delete
- degree = 2, left child < parent < right child  의 규칙을 따르므로 search 에 용이한 구조
- search = search 범위를 계속 반으로 줄여나감, O(Height) = O(logN), linked list 보다 search 빠름
- 0 child 갖는 노드를 지우는 경우 = 포인터만 끊어주면 됨
- 1 child 갖는 노드를 지우는 경우 =  포인터를 끊어서 child 에 연결
- 2 child 갖는 노드를 지우는 경우 = 해당 노드의 왼쪽자손들의 최대값 or 오른쪽 자손들의 최소값을 해당 노드에 복사한 후 원래 최대값 또는 최소값 노드 자리를 지운다
- 최소값 찾기 = 왼쪽으로 내려가기
- 최대값 찾기 = 오른쪽으로 내려가기


### Depth first traverse 
- left -> right
- (재귀 사용)
- pre-order = current -> left -> right
- in-order = left -> current -> right (정렬 효과)
- post-order = left -> right -> current


### breadth first traverse
- level순서 
- (queue, 반복문 사용)
- enqueue root
- queue 가 empty 될 때까지 밑에 반복
- current를 dequeue
- 빼낸 것의 left , right child를 enqueue


# priority queue
- linked list 이지만 node가 value, nextNode, priority를 지님 
- lazy approach = enqueue 는 똑같고, dequeue시에 priority 에 따라 sorting 해서 먼저 빼내기
- early bird approach =  enqueue 시에 prioiry 에 따라 sorting해서 적합한 자리에 넣고, dequeu는 똑같음
- priority 에 따라서 sorting 할 때 O(n) 걸려서 비효율적 -> max binary heap 으로 해결가능


# max binary heap
- complete tree 이면서 parent 의 우선순위가 child 보다 높은 것을 만족하는 binary tree 
- prioirty 에 따라 정렬 시 max  값(root)을 O(1)로 찾을 수 있음
- linked list 대신 array로 대체해서 insert, delete 하면 편하다
- prioirty queue의 enqueue = complete tree 구조를 만족시키기 위해 마지막 레벨의 다음 넣을 자리에 넣은 삽입한 후 위로 올라가면서 parent 와 비교해서 자리 교체(재귀), O(logN)
- priority queue의 dequeue (root delete) = root 를 지우고 complete tree 구조를 유지하기 위해 가장 마지막 노드를 root 차리에 채운 후 밑으로 내려가면서 bigger child 와 비교해서 자리 교체(재귀), O(logN)



---

# O(N^2) sorting
- inner loop, outer loop 사용
- 오래걸림
- 구현이 쉽다
- insertion sort 
- selection sort(최소값 찾아서 빼내고 거기서 또 최소값 찾아서 빼내고)
- bubble sort


# O(N*logN) sorting
- 작은 단위로 쪼개서 푼 후 합치기 (divide and conquer)
- 재귀사용
- 단점 = 제대로 쪼개지 못하면 O(N^2) 될 수도 있음
- merge sort = 절반으로 계속 최소단위가 될 때까지 쪼갠 후, 재귀로 합치면서 sorting
- heap sort
- quick sort = pivot 을 기준으로 divide and conquer. pivot을 잘 고르는 것 이 중요.


# O(N) sorting
- 특정 조건에서 비교를 하지 않고 정렬가능
- count sort = 정렬할 대상이 0 ~ K 범위의 int 인 경우에만 가능. arr의 index에 0~K 까지 넣고 각각 몇개 있는지 체크 후,  인덱스 순서대로 나열 하면 끝. 즉 정렬할 대상을 하나씩 갯수 파악할 때 O(N), 갯수 다 적은 후 순서대로 프린트 할 때 O(N) 이므로 총 O(2N) 이므로 상수 무시하고 O(N)
- radix sort = integer 조건, 작은 자릿수부터 시작해서 각 자릿수마다 count sort 를 한다. O(N * digitCount)


# bubble sort
- n개의 배열 정렬할 때
- 각 인덱스마다 다른 인덱스들과 비교하면서 적합한 수로 교체한다
- n + (n-1) + (n-2) + ... + 1 번의 operation이 필요하다, O(N^2)


# heap sort
- heap 구조를 만들어서 정렬해야할 값들을 하나씩 넣어준다
- 값을 insert 한다. O(logN) = O(H)
- n개를 넣으므로 O(N*logN) 걸림
- 최대값인 루트를 제거하는 데 O(logN) 걸림
- 즉 최대값을 찾아서 빼고 다시 나머지 중 최대값 찾는 걸 반복하면 정렬 가능 O(N*logN)
- 즉 값들을 힙에 넣어줄 때 O(N*logN), 루트를 하나씩 뺄 때 O(N*logN) 걸리므로 총 O(2*N*logN) 걸리므로 상수 무시하고 O(N*logN) 걸린다고 할 수 있음
