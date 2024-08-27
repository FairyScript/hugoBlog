store可以由一下几部分构成
- data: 基本的数据
- accessor: 方便基于一个索引(例如,id)从 store 中提取数据. 例如: `getDataById()`
- deriveData: 计算状态,基于 store 中已有的数据派生得来
- mutation: 使 store 发生变化的动作,一般有参数.可以影响一个字段,也可以影响多个字段
- event: 事件,不一定使 store 发生变化,也不一定有参数.
