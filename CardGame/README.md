# Card Game

## :round_pushpin: Step 9-1 카드 클래스

- Card class 설계
  - suits 4개 : ♠︎spade ♣︎club ♥︎heart ♦︎diamond
    - ♠︎spade `\u{2660}`
    - ♣︎club `\u{2663}`
    - ♥︎heart `\u{2665}`
    - ♦︎diamond `\u{2666}`
  - rank 1~13 : 1A, 11J, 12Q, 13K
    - J : Jack
    - Q: Queen
    - K : King
    - A: Ace
- `Card` class 내부에 각각 정의
  - enum `Suits` : 4가지 기호 케이스별로 나누기에 적절
  - enum `Rank` : 유한집합. 케이스별 처리 위해 enum로 구현
- `CustomStringConvertible` protocol 채택하기
  - `Card` class, enum `Suits`, `Rank`
  - 직관적인 인스턴스 출력을 위해 채택.