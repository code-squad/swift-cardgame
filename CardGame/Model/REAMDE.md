# Model

### 1 단계

- Card 

class로 구현한 이유  : 카드가 다른 곳으로 이동을 할 때 struct는 복사가 되어 이동되어 기존 카드가 아닌 복사된 카드로 이동이 되어, class로 할 경우 동일한 카드가 참조만 되어 이동을 하여 class로 구현

How to use
```
let card = Card(Suits, Rank)       
pritn(card.dscription)  //  

```

### 2 단계

- Deck 

1. count() 갖고 있는 카드 개수를 반환한다.
2. shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
3. removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
4. reset() 처음처럼 모든 카드를 다시 채워넣는다.


How to use
```

let deck = Deck()   // 카드가 생성
deck.count()        // 현재 카드의 갯수를 리턴
deck.removeOne()    // 맨위의 카드를 리턴
deck.reset()        // 카드를 다시 세트

```
