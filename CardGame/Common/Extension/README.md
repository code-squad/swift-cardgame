# Enum

2 단계

- Rank+ 

: protocol인 EnumCollection을 채택하여 구현

case 별로 모든 description 값을 구한기 위해 배열로 리턴

How to use
```

for value in Rank.allValues {
    ....    // value.description
}

```

- Sutis+ 

: protocol인 EnumCollection을 채택하여 구현

case 별로 모든 description 값을 구한기 위해 배열로 리턴

```

for suit in Suits.allValues {
    ...     // suit.rawValue
}

```

- Int+

: Int를 UInt32로 변환을 하는 함수를 구현하기 위해 확장 

How to use

```

var intValue: Int = 0       // return type : Int

intValue.convertUInt32()    // return type : UInt32  

```

- Deck+

: Equatable 구현

