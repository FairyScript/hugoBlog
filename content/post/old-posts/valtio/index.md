---
title: 'Valtio 笔记其一：正交的状态管理'
date: 2022-02-25 03:01:35
image: cover.webp
tags:
  - Valtio
  - React
  - 状态管理
---

研究了两天，尝试用 Valtio 重构之前的一个项目，有了一些收获

<!-- more -->

```ts
//a.ts
const stateA = proxy({
  id: 0,
  get activeID() {
    return state.id
  },
  active: (id: number) => {
    state.id = id
  },
})

//b.ts
const stateB = proxy({
  fState: ref(stateA),
  testChange: () => {
    console.log('其他的state可以互相引用修改')

    state.fState.active(4)
  },
})
```

Valtio 好就好在可以用一个非常简单的模式完成 state 和 UI 的解耦，因为 state
本身是可变的，所以可以尽情的利用原生 js 的特性操作。不会有 react 额外的噪音。对于 react 的使用，我选择把所有可能的操作都封装为 hooks ，这样就尽可能的保证了 UI 的逻辑无关

```ts
//a.ts
const stateA = proxy({
  id: 0,
  get activeID() {
    return state.id
  },
  active: (id: number) => {
    state.id = id
  },
})

export function useStateA() {
  const _state = useSnapshot(stateA)
  return _state
}

//需要的生命周期 Hooks 和state封装在一起
export function useIDUpdate() {
  const _state = useSnapshot(stateA)

  useEffect(() => {
    foo().then((res) => {
      state.active(res)
    })
  }, [])

  return state.activeID
}
```

非常干净，非常清爽，非常强大。
