# SthFun
Let's learn something fun about iOS.

## ContainString:

 在NSArray中检测是否有目标string

>无论是@""生成的（常量区）或者是[NSString stringWithFormat:]生成的（堆或者栈），都只比较值。
>
>原因：NSArray的containsObject:对其中的元素调用了isEqual:方法，而NSString的isEqual:其实就是isEqualToString:。
>
>如果真的想检测指针是否相同，可以遍历元素，使用==比较；或者[stringArray indexOfObjectIdenticalTo:someString] != NSNotFound。

## LocationOfString

获取不同初始化方式生成的字符串存储位置

> 以 @"xxx" 方式生成的字符串存储在常量区，且相同字符串地址相同。
>
> 以 [NSString stringWithFormat:] 方式生成的字符串，长度短于12的存储于栈区，且相同字符串地址相同；大于等于12的存储于堆区，且相同字符串地址不同。（地址数值大小：代码区 < 常量区 < 全局区 < 堆区 < 栈区）

## ObjectOrValueForKey

  比较NSDictionary和NSString的objectForKey和valueForKey

>对于NSDictionary来说:
>
>objectForKey的key必须是dic中key-value对中的key。
>valueForKey的key是dic中key-value对中的key；或者NSDictionary的属性，但属性需要单独加@，即@"@property"。
>然而！如果kv对中的key以@开头，objectForKey能正确获取，valueForKey会直接报错。
>
>对于NSString及其他类来说：
>
>valueForKey的key是它的属性，且不需要加@。
