#

iOS 开发常用：

1. [iOS 开发常用三方库、插件、知名博客等等][awesome-ios]
1. [正则表达式学习][learn-regex]

[learn-regex]: https://github.com/ziishaned/learn-regex/blob/master/translations/README-cn.md

[awesome-ios]: https://github.com/Tim9Liu9/TimLiu-iOS

iOS 开发书籍、文档：

1. [中文版《Programming with Objective-C》][ObjC]
1. [中文版《Google Objective-C Style Guide》][ObjC 风格指南]
1. [中文版《The Swift Programming Language》][Swift]

[ObjC]: http://www.bczl.xyz/objc/doc-zh/
[ObjC 风格指南]: https://zh-google-styleguide.readthedocs.io/en/latest/google-objc-styleguide/contents/
[Swift]: https://gitbook.swiftgg.team/swift/

Git 统计指定日期范围内的改动代码行数

```shell
git log --author="$(git config --get user.name)" \
--since=2022-10-12 --until=2023-04-12 \
--pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } \
END { printf "新增行数：%s，移除行数：%s，总行数：%s\n", add, subs, loc }' 
```
