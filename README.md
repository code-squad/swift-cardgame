# 코딩스타일 가이드라인

## 나만의 코딩스타일


### 코드레이아웃 (layout)
- 들여쓰기는 탭(tab)을 사용한다.
- 콜론(colon) 사용 시 오른쪽에만 공백을 둔다.
- 단어 단위로 공백을 둔다.
- 구문의 중괄호(culry bracket) 시작은 클래스 이름과 공백 다음에 이어쓴다.
```
class GameInfo {
    var kindOfGame: Int = 0
    var numberOfPlayer: Int = 0
}
```

### 이름지정하기 (Naming)
- 클래스 이름은 UpperCamelCase를 사용한다.
- 변수와 함수 이름은 lowerCamelCase를 사용한다.
- 약어를 사용하지 않는다.

```
class CardDeck {
    private var deck: [Card]

    func count() -> Int {
        return deck.count
    }
}
```

### 주석
- `///` 를 사용해서 코드에 설명이 필요한 부분에 주석을 남긴다.
- 일시적으로 일부 기능 제거 시 해당 기능 관련 코드 윗줄에 `/********** description **********/` 를 사용해서 기능에 대한 설명 주석을 남긴다.
```
// 주석을 사용하여 입력기능을 잠시 사용하지 않음.
/********** input menu (step 1, 2, 3) **********/

/*
    var isPlay = true

    repeat {
        // inputview
        let inputView = InputView()
        let numberOfMenu = inputView.printMenu()
        if numberOfMenu == 4 {
        isPlay = false
    }

    // outputview
        let outputView = OutputView(cardDeck: cardDeck)
        outputView.printResult(numberOfMenu: numberOfMenu)
    } while isPlay
*/
```

## 참고사이트
- https://github.com/StyleShare/swift-style-guide
- https://github.com/raywenderlich/swift-style-guide/
  (한국어: http://kka7.tistory.com/59)
- https://swift.org/documentation/api-design-guidelines/
