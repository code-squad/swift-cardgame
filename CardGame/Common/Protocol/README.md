# protocol

2 단계

- EnumCollection 

: enum인 Rank와 Suits는 case별로 모아 둔 배열이 필요하여 그 것을 구현하는 allValues라는 함수를 구현

allValues를 protocol로 구현한 이유 : Rank와 Sutis 둘다 case는 다르지만 결과 값은 비슷하여 protocol 을 준수 시켜 구현하여 동일 한 효과를 가져오기 위함
