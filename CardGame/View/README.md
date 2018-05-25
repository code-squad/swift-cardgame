# VieW

### 1 단계

-  Outputview 

```
1. 단계

let card = Card(Suits.clover, Rank.Ace)
OutputView.showCard(card)               // ♠ A

2. 단계 

// start select Mesaage
OutputView.cardGameSelectMassgae()  

// error 
do {
// error
}catch let e as CardGameError {
OutputView.errormessage(e) // error
}
}

```

### 2 단계

- InputView

```
let order = try InputView.order()
```

- ouptutview

: 결과 값을 출력하는 함수 -> deelerMesage 추가 파라미터로 protocol을 받아서 실행
