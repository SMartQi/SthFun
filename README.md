# SthFun
Let's learn something fun about iOS.

## LocationOfString

获取不同初始化方式生成的字符串存储位置

> 以 @"xxx" 方式生成的字符串存储在常量区，且相同字符串地址相同。
>
> 以 [NSString stringWithFormat:] 方式生成的字符串，长度短于12的存储于栈区，且相同字符串地址相同；大于等于12的存储于堆区，且相同字符串地址不同。（地址数值大小：代码区 < 常量区 < 全局区 < 堆区 < 栈区）
