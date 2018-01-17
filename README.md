- 미션 요구사항 진행용 README는 [여기](https://github.com/youth27/swift-cardgame/blob/card-step3/README2.md)에 있습니다.
- 미션 진행 단계별 상세한 피드백은 [Wiki](https://github.com/youth27/swift-cardgame/wiki)에 있습니다.
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

- 2018.01.11 / step1 피드백에 따른 수정 :
  - Card 객체 NSObject 상속하고 description속성 추가
  - OutputView객체에 있던 객체 속성 문자열 만드는 함수 제거
  - OutputView객체의 showResult()함수의 인자를 Card타입으로 변경
  - Card객체의 init() 호출 시 유추 가능한 파라미터 타입은 케이스 명만 쓰는 것으로 변경

- 2018.01.11 / step2 요구사항 구현 : CardDeck에 기본 메뉴 기능구현, InputView추가, main에 흐름제어구문 추가

- 2018.01.12 step2 피드백에 따른 수정 : OutputView의 showResult(), EnumCollection추가, GameMenu enum 추가
- 2018.01.15 step3 요구사항 구현 : CardStack 구조체 추가, main.swift에 함수 추가, 코딩스타일 가이드라인을 작성-[README2](https://github.com/youth27/swift-cardgame/blob/card-step3/README2.md)
- 2018.01.16 step4 요구사항 구현 : GameInputView구조체 추가, Player, Dealer클래스 구현과 상속, main에 흐름제어구문 추가
