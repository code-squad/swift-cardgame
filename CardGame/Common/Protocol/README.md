# protocol

2 단계

- EnumCollection 

: enum인 Rank와 Suits는 case별로 모아 둔 배열이 필요하여 그 것을 구현하는 allValues라는 함수를 구현

allValues를 protocol로 구현한 이유 : Rank와 Sutis 둘다 case는 다르지만 결과 값은 비슷하여 protocol 을 준수 시켜 구현하여 동일 한 효과를 가져오기 위함

- RecievedAsk 

: Deeler가 결과 값을 말하기 위해서는 Ouputview에서 결과를 출력해야하지만 view가 자신이 무엇을 보여줄지 선택하는 것이 아니라 Protocol을 활용하여 출력


- 3 단계 

- FieldCardStack 

: CardStack에서 결과를 출력하기 위해 준수해야 프로토콜 -> 의존성을 부여하여 결과를 출력 하기 위한 용도
