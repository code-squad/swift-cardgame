# Enums

### 1. 단계

-    Suits : 모양을 저장하는 enum

```
print(suit.spade)         // ♠
print(suit.clover)        // ♣
print(suit.heart)         // ♥
print(suit.diamond)       // ◆
```

- Rank : 숫자를 저장하는 enum

```
let rank.King.description        // K
let rnak.Queen.descriptino       // Q
...

```

### 2 단계

- Error  : GardGameError에서 에러 메시지를 관리

```
throw를 통해 error 메시지 하나로 출력을 위한 캐스팅
```

사용 예시

```
do {

// error 

}catch let e as CardGameError {
    print(OutputView.errorMessage(e))   // error 출력
}
```


