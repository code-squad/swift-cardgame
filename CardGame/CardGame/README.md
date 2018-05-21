# CardGame

1 단계

- Card 

```
let card = Card()       
pritn(card.dscription)  //  
```

2 단계

반복 문  추가 -> 무한 루프

selectNumber 로 switch 구현

How to use

```

while let selectNumber = try InputView.readInput() { // <- 입력
    do {
        // controller
    }catch let e as CardGameError {
        // error handing
    }
}

```

