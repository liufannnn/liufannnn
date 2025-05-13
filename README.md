
### [打工不如有一技之长的小老板](https://github.com/shengcaishizhan/kkndme_tianya/blob/master/README.md#打工不如有一技之长的小老板)

> 中年不惑吗：
>
>> 现在他们已经比一般的小白领强了，人力成本只会越来越高，现在去读个技校，当个技工肯定比一般大学出来强多了。肯定比**一般大学**出来强多了。
>>
>> 还有一个问题：一般企业的工资10年没有变，10年前某个职位是5000，10年后这个职位还是5000；而在10年间，民工工资可能从1000涨到了3000， 房价更是涨了10倍；菜价生活用品也翻了数倍，高房价问题其实就是分配问题，如果某个从事的职位10年前和10年后是一样的，那也就相当于这个职位的薪水降了相当多
>
> kkndme：
>>  进不了体制内的，无论是不是大学毕业，凡是有头脑的、懂做生意的，会一技之长的，只要不懒，活的肯定比无特长一般在公司打工的小白领强。 古代也是这样的，街面上卖爆肚的肯定比大户人家厨房里负责切葱的日子过的稳当。卖爆肚的小本生意很累很辛苦，但是有个手艺就不会饿肚子。大户人家切葱的上班期间日子过的比较轻松，甚至收入比卖爆肚的还强点，在大户人家也体面些。但一旦大户人家不要切葱的了，裁员了，这个切葱的出来还真没办法养活自己。
>>
>> 大学文凭顶多算个秀才资格，有这个资格才有机会举士，但是举不了士的，就必须学点技术，否则收入远远赶不上瓦工、电工。 过去的穷秀才，饭都吃不饱，但是社会地位却不差，一旦中了恩科，就是宰相根苗。现在有点不同，进不了体制内，又没点技术，那肯定沦为社会的最底层，不要说买房子了，能不能解决吃饭问题都不一定。

---

### iOS 开发常用：

1. [iOS 开发常用三方库、插件、知名博客等等][awesome-ios]
1. [正则表达式学习][learn-regex]

[learn-regex]: https://github.com/ziishaned/learn-regex/blob/master/translations/README-cn.md

[awesome-ios]: https://github.com/Tim9Liu9/TimLiu-iOS

### iOS 开发书籍、文档：

1. [中文版《Programming with Objective-C》][ObjC]
1. [中文版《Google Objective-C Style Guide》][ObjC 风格指南]
1. [中文版《The Swift Programming Language》][Swift]

[ObjC]: http://www.bczl.xyz/objc/doc-zh/
[ObjC 风格指南]: https://zh-google-styleguide.readthedocs.io/en/latest/google-objc-styleguide/contents/
[Swift]: https://gitbook.swiftgg.team/swift/

### Git 统计指定日期范围内的改动代码行数

```shell
git log --author="$(git config --get user.name)" \
--since=2022-10-12 --until=2023-04-12 \
--pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } \
END { printf "新增行数：%s，移除行数：%s，总行数：%s\n", add, subs, loc }' 
```
