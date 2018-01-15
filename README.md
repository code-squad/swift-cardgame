미션 요구사항 진행용 README는 [여기에](https://github.com/youth27/swift-cardgame/blob/card-step3/README2.md)있습니다.
***
## 미션 진행 과정 - Daily
- 2018.01.09 : Card, CardDeck(enum타입만 가지고있음), OutputView객체 생성
  - Card 객체의 속성(suit, denomination) enum타입으로 지정
  - Card속성의 출력을 위해 Enum에 CustomStringConvertible 구현
- 2018.01.10 : Card의 속성,메서드 변경, OutputView의 showResult()파라미터 변경
  - Card 속성의 접근제어자 변경, String반환 메서드 변경
  > 프로퍼티를 출력할 수 있는 두가지 방법은 아래와 같다. <br/>
  > 다만 여기서 Card클래스는 그 자체로 한 장의 카드의 의미니까 `.description`같은 키워드 없이 바로 `print(card)`처럼 사용하면 카드의 속성인 suit와 denomination이 출력되도록 NSObject를 상속받는 두 번째 방법을 사용했다. <br/>
  > 특히, 이렇게 하는게 `객체 자체가 자신의 description 문자열로 만드는 것이 자연스럽다.`는 원칙에도 더 부합한다고 생각했다.
  > ```swift
  > class Test {
  >      var description:String {
  >        return "This is Test"
  >    }
  >}
  >let t = Test()
  >println(t.description)
  >
  > // NSObject 상속받았을때
  >class Test1:NSObject {
  >    override var description:String {
  >        return "This is Test"
  >    }
  >}
  >let t1 = Test1()
  >println(t1) // 바로 인스턴스이름을 출력하면 description이 출력된다.
  > ```

  - OutputView의 showResult() : card의 속성을 출력할때 description을 이용하기위해, `String`파라미터였던 것을 `Card`타입으로 변경했다. 원래는 `Any`로 해도 동작했었는데, 지금 현재는 Card의 속성을 출력할때만 사용되고있으니 파라미터는 `Card`로 정했다.

- 2018.01.11 : CardDeck에 기본 메뉴 기능구현, InputView추가, main에 흐름제어구문 추가
  - CardDeck기능 :count(), shuffle(), removeOne(), reset()
    > CardDeck은 카드 52장을 초기화하고, 섞고, 한 장 뽑고, 현재 가지고있는 카드 수를 세는 기능을 한다. <br/>
    > CardDeck의 책임과 기능으로 본다면 `[Card]`를 속성으로 가지고있어야하는데, 그 속성의 상태를 어떤식으로 바꾸느냐가 고민되었다. CardDeck의 동작에 따라 `[Card]`가 바뀐다면, 그 메소드들은 결국 자신의 속성을 계속 바꾸니까 mutating동작을 계속 하게된다는게 문제가 될 것 같았다. [(Class에서는 mutating키워드가 없어도 되지만_관련링크!)](https://stackoverflow.com/questions/38422781/mutating-function-inside-class)<br/>
    > (객체 자신의 속성을 내부에서 변경한다는 뜻으로) 특히 수업때나 여기저기서 mutating은 되도록 안쓰는게 좋는 말을 들어서, mutating을 쓰지 않는 방법으로 고민해봤는데 **만약 그 객체의 속성이 변경되는 것 때문에 새 속성이 만들어지는대로 객체를 새로 만드는게 더 비효율적이었다.** 만약 이 방법으로 한다면 CardDeck의 동작을 호출하는 상위모듈에서 속성이 바뀌는 동작을 할 때마다 CardDeck객체를 새로 만들어야 의도한대로 동작할것같았다. <br/>
    > mutating은 만약 남용하면 부정적인 측면이 있어서 되도록 남용되는 것은 권장되진않지만 만약 mutating을 쓰는것이 더 효율적인 경우 사용해도된다고해서, **CardDeck객체 내부에서 속성을 변경하기로했다.**

  - CardDeck의 reset() : 현재는 새로운 CardDeck()객체를 리턴하는 역할. <br/>
  CardDeck은 init()이 없이 빈 카드 배열로 초기화가 되고, reset()에서 카드의 suit과 denomination대로 52개의 카드객체가 만들어져서 배열에 담는 작업을 하는 식으로 설계했다. 이렇게 되니 CardDeck객체를 만들고 바로 shuffle을 하면 `0장의 카드를 섞는` 이상한 동작을 했다.. 그래서 CardDeck은 항상 객체 생성 때부터 52장의 `[Card]`를 가지도록 init()을 만들었다. 이렇게 하니 reset()과 init()이 이름만 다르지 로직 코드가 완전히 동일해져버렸고, 심지어 상위모듈에서 reset()을 호출하면 `[Card]`를 리턴해버리니까 warning이 뜬다.
    - 해결: reset()에서의 리턴값을 CardDeck()으로 만듦!

  - CardDeck의 shuffle() : Fisher-Yates알고리즘 사용하여 구현. 스위프트엔 Array를위한 shuffle 메소드를 제공하지 않는다...
  - enum iteration : enum의 케이스들을 순환해야했는데, (또)스위프트는 enum을 iterate하는 기능을 제공하지 않는다고 한다.

  ```swift
  enum Suit: String {
      case heart = "♥️"
      case diamond = "♦️"
      case clover = "♣️"
      case spade = "♠️"

      static let allValues = [heart, diamond, clover, spade]
  }
  ```

  사용은 이런 식으로 할 수 있다.
  ```swift
      ...
      for shape in Suit.allValues {
        for number in Denomination.allValues {
          cards.append(Card(suit: shape, denomination: number))
        }
      }  
      ...
  ```
- 2018.01.12 : OutputView의 showResult(), EnumCollection추가, GameMenu enum 추가
