# 이름 작성 기준

> 클래스 , 변수 , 메소드 이름

## CardAction
> 카드에 대한 행동 객체
- reset : 카드 생성
- shuffle : 카드 랜덤 섞기
- removeOne : 카드 한장 뽑기

## CardDeck
> 카드에 대한 행동 로직
- reset : 카드 생성
- shuffle : 카드 랜덤 섞기
- removeOne : 카드 한장 뽑기
- remove : 카드 여러장 뽑기

## CardProperty
> 카드를 구성하는 요소
- CardShape(Enum) : 카드 모양
- CardNumber(Enum) : 카드 숫자

## Card
> 카드 정보를 추상화하는 데이터 구조
- cardNumber : 카드의 숫자
- cardShape : 카드의 모양

## InputView
> 프로젝트의 입력을 담당
- readInput : 처음 입력받는 값
- isEmpty : 입력받은 값이 비어있는지 여부 확인

## OutputView
> 프로젝트의 출력을 담당
- printAction : 카드를 이용한 행동 출력
- printCards : 카드 여러장 출력
- printError : 에러 출력

## CardError
> 카드 에러 객체




