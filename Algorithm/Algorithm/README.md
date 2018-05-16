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
- linked list 구조를 확장한 것. but 트리는 한줄이 아님
- parent 하나당 여러개의 children
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
- 일단 한줄로 깊이 들어가기
- left -> right
- 재귀 사용. stack
- pre-order = current -> left -> right
- in-order = left -> current -> right (정렬 효과)
- post-order = left -> right -> current


### breadth first traverse
- 동일한 레벨부터 
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

# hash table
- key, value 쌍을 저장하는 큰 사이즈의 테이블
- hash func = key 값을 array index 로 변환
- index 충돌이 일어나지 않을 때에는 search, insert, delete 모두 O(1)

## hash func
- modulo = 어떤 양의 정수로 key 값을 나눈 후 나머지 값을 index로 하는 방법, 나머지는 범위가 정해져 있으므로 hash table의 사이즈를 제한할 수 있다
- mid-square = key값을 제곱한 후 중간의 몇개의 자릿수를 추출한 수를 가지고 modulo 방법으로 처리
- digit-analysis = key값의 각 자릿수를 다 더한 수를 가지고 modulo 방법으로 처리

## index 충돌시 해결방법
- closed addressing = 동일한 인덱스에 value 들을 linked list 또는 트리 구조로 추가.
- open addressing = 인덱스 겹칠 때 비어있는 다른 인덱스를 찾아 이동

## delete in open addressing hash table
- 인덱스 충돌이 일어나서 open addressing 방법으로 삽입한 값을 지울 때에는 그냥 지워버리면 다음 값 지울 때 못찾으므로 실제로 지우지 말고 지웠다는 표시만 해둔다
- 값을 안지우면 나중에 공간이 부족해지므로 새 테이블로 insert하는데, 이 때 지웠다고 표시된 것들은 새 테이블에 insert 안한다


---

# graph
- 트리는 한 부모당 여러 자식이 존재하나, 그래프는 뒤죽박죽
- 그래프는 노드(vertex), 엣지 의 집합
- DAG = Directed Acyclic Graph, 엣지가 방향이 있지만 사이클이 없는 그래프

## Adjacency matrix
- 각 노드에 달려있는 엣지들을 array 에 저장
- 각 노드에 임의의 인덱스를 부여
-  A[i, j] =  i 번째 노드에서 j 번째 노드로 가는 엣지, 없으면 0, 있으면 1, 가중치 그래프라면 가중치값 
- 대부분 엣지가 없으면 대부분 0이 채워지는 쓸데없는 메모리 낭비 유발하므로 dense 그래프에 적합. 즉 각 노드를 연결하는 엣지가 대부분 존재하는 그래프에 적합. 


## Adjacency list
- 각 노드에 달려있는 엣지들을 linked list 에 저장
- sparse한 그래프에 적합


## DFS traverse
- 일단 한줄로 깊이 들어가기
- 재귀, stack
- pre-order = current -> child
- 트리와 달리 루트가 없으므로 시작 노드를 임의로 선정해서 시작
- 트리와 달리 사이클이 있을 수 있으므로 이전에 방문한 노드는 기록해놨다가 재방문 안하도록





## BFS traverse
- 동일 레벨부터 방문
- 트리와 달리 루트가 없으므로 시작 노드를 임의로 선정해서 시작
- 트리와 달리 사이클이 있을 수 있으므로 이전에 방문한 노드는 기록해놨다가 재방문 안하도록
- queue 에 시작 노드를 넣고 노드를 큐에서 dequeue 할 때마다 해당 노드의 children을 enqueue 한다


## 최단경로 찾기, 다익스트라
- 그래프, 시작노드의 정보가 주어짐
- memoization table =각 노드까지의 누적거리를 나타낸다. 출발 노드 누적저리는 0, 나머지노드까지의 누적거리는 무한대로 표시해놓기, 각 노드까지 걸리는 누적거리를 현재보다 작은 값이 나오면 업데이트
- O(logV) = 각 노드(V)까지의 누적거리의 최소값을 찾아야 하므로 binary heap 을 사용하여 최소값 구한다
- retrace table = 최단경로를 위한 과정경로를 저장해둔다




## minimum spanning tree
- 모든 노드를 최단거리로 커버할 수 있는 base camp 찾기
- 즉 모든 노드를 최소한의 operation 으로 traverse 할 수 있는 트리를 찾기
- U = covered vertex 집합
- U 에 시작노드만 넣어놓고 시작한다
- coverd 노드집합과 uncovered 노드집합을 연결하는 최소 가중치의 엣지를 찾아서 그 노드를 cover 한다. uncoverd 노드가 없어질 때까지 과정을 반복한다




---

# O(N^2) sorting
- inner loop, outer loop 사용
- 오래걸림
- 구현이 쉽다
- insertion sort 
- selection sort(최소값 찾아서 빼내고 거기서 또 최소값 찾아서 빼내고)
- bubble sort

## selection sort
- n개의 배열에서 가장 큰 수를 찾아서 배열의 마지막 원소와 바꿔치기
- n-1 배열에서 가장 큰 수 를 찾아서 이 배열의 마지막 원소와 바꿔치기
- 반복
- O(n^2)

## bubble sort
- n개의 배열 정렬할 때
- 배열의 첫번째 원소를 순서대로 비교해서 비교한 수 보다 크면 서로 위치를 바꾸기
- n + (n-1) + (n-2) + ... + 1 번의 operation이 필요하다, O(N^2)

## insertion sort
- selection sort 나 bubble sort의 절반정도 소요된다
- n 크기의 배열이 있을 때 첫 원소부터 n 크기의 배열을 순서대로 정렬해나가는 방법
- 즉 정렬된 앞의 배열에 그 다음 원소를 적절한 위치에 삽입하는 방법
- 최악의 경우 O(n^2)
- 최선의 경우 O(n)

---

# O(N*logN) sorting
- 작은 단위로 쪼개서 푼 후 합치기 (divide and conquer) = 비교를 사용하여 O(N^2)을 O(N*logN)으로 개선
- 재귀사용
- 단점 = 제대로 쪼개지 못하면 O(N^2) 될 수도 있음
- merge sort = 절반으로 계속 최소단위가 될 때까지 쪼갠 후, 재귀로 합치면서 sorting
- heap sort
- quick sort = pivot 을 기준으로 divide and conquer. pivot을 잘 고르는 것 이 중요.

## merge sort
- 분할정복법: 작은 크기의 '동일한' 문제로 분할, 합병이 중요
- 데이터가 저장된 배열을 절반으로 나눔
- 각각을 순환적으로 정렬
- 정렬된 두 배열을 합쳐 전체를 정렬 (이 때 합 친 원소를 담을 새로운 배열이 필요한 단점)
- 정렬된 두 배열을 합칠 때 두 배열의 첫번째 원소를 비교해서 그 중 작은 것을 새배열의 왼쪽에 넣기
- O(n * logn)


## quick sort
- 분할정복법: 피봇을 기준으로 분리하는 파티션이 중요
- pivot을 선정(주로 배열의 제일 마지막 원소로 선정)해서 피봇보다 작은 그룹과 피봇보다 큰 그룹으로 나눈다
- 각 그룹을 재귀 호출해서 정렬
- 합칠 필요 없음
- 최악의 경우: 피봇이 최대값 또는 최소값인 경우 O(n^2)
- 최선의 경우: 피봇이 중값값일 경우. O(n * logn)
- 평균 시간복잡도 역시 빠르다: O(n * logn)

## heap sort
- heap 구조를 만들어서 정렬해야할 값들을 하나씩 넣어준다
- 값을 insert 한다. O(logN) = O(H)
- n개를 넣으므로 O(N*logN) 걸림
- 최대값인 루트를 제거하는 데 O(logN) 걸림
- 즉 최대값을 찾아서 빼고 다시 나머지 중 최대값 찾는 걸 반복하면 정렬 가능 O(N*logN)
- 즉 값들을 힙에 넣어줄 때 O(N*logN), 루트를 하나씩 뺄 때 O(N*logN) 걸리므로 총 O(2*N*logN) 걸리므로 상수 무시하고 O(N*logN) 걸린다고 할 수 있음

---


# O(N) sorting
- 특정 조건에서 비교를 하지 않고 정렬가능
- count sort = 정렬할 대상이 0 ~ K 범위의 int 인 경우에만 가능. arr의 index에 0~K 까지 넣고 각각 몇개 있는지 체크 후,  인덱스 순서대로 나열 하면 끝. 즉 정렬할 대상을 하나씩 갯수 파악할 때 O(N), 갯수 다 적은 후 순서대로 프린트 할 때 O(N) 이므로 총 O(2N) 이므로 상수 무시하고 O(N)
- radix sort = integer 조건, 작은 자릿수부터 시작해서 각 자릿수마다 count sort 를 한다. O(N * digitCount)






