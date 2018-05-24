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
