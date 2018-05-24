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

피드백 

try - catch를 사용할 경우에 try로 예외처리가 발생할 부분만 try-catch 내부로 포함시켜주세요. 다른 부분이 모두 들여쓰기해서 들어가는 것보다 빼는게 더 좋겠습니다.
지금처럼 resultMessage 라는 출력용 문자열을 각각 만드는 것과 별개로 출력하는 것은 어떤 차이가 있을까요?

문자열을 만드는 것보다 의존성을 주어 view 에서 단순 값만 전달하는 형태로 하는 것이 더 효율적? 인거 같습니다. 그래야 clean architecture에서 나오는 형태 맞는 거 같습니다.



