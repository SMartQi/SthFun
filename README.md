# SthFun
Let's learn something fun about iOS.

## CallStack:

打印调用栈，解析一行的每个item

## ContainString:

在NSArray中检测是否有目标string

>无论是@""生成的（常量区）或者是[NSString stringWithFormat:]生成的（堆或者栈），都只比较值。
>
>原因：NSArray的containsObject:对其中的元素调用了isEqual:方法，而NSString的isEqual:其实就是isEqualToString:。
>
>如果真的想检测指针是否相同，可以遍历元素，使用==比较；或者[stringArray indexOfObjectIdenticalTo:someString] != NSNotFound。

## InfoForSymbolication:

 针对崩溃栈中的某一行做符号化

> atos -o UUID对应的dsym文件路径/Contents/Resources/DWARF/App名称 -arch 手机架构 -l binaryImageAddress 崩溃日志中的内存地址


## LocationOfString

获取不同初始化方式生成的字符串存储位置

> 以 @"xxx" 方式生成的字符串存储在常量区，且相同字符串地址相同。
>
> 以 [NSString stringWithFormat:] 方式生成的字符串，长度短于12的存储于栈区，且相同字符串地址相同；大于等于12的存储于堆区，且相同字符串地址不同。（地址数值大小：代码区 < 常量区 < 全局区 < 堆区 < 栈区）


## NullValueInDictionary

构造NSDictionary崩溃为[NSNull objectForKey:]:unrecognized selector的case

>一般情况下，NSDictionary里面不会出现空数据，oc代码直接构造的dic不允许nil的存在。
>
>但是当dic是经由网络数据构造时，空数据可能会以NSNull的格式写入，后续操作时必须判断类型，否则会发生unrecognized selector崩溃。


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


## Snapshot

整个页面的截图，及截图的压缩

>图片jpeg压缩0.9和1区别极大，将近压缩一半；但是0.9以下区别并不大，0.1比0.9的大小也就少一半多点而已。
>
>视觉效果来看，0.6以上就差不太多了。
>
>【以上数据只对此特定内容的image有效】