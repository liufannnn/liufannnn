1. [制作 Framework](https://www.finclip.com/blog/first-app-ep02/)，[bitcode is now deprecated, builds for iOS, tvOS, and watchOS no longer include bitcode by default](https://developer.apple.com/documentation/xcode-release-notes/xcode-14-release-notes)

   > [强烈推荐制作 XCFramework（注意类名不允许与框架名相同，引用的第三方库存在这个情况也不行）](https://xie.infoq.cn/article/38a800650b100239810976c85)

   - 将`Build Setting`的`Mach-O Type`设置为`Static Library`

     > 为什么是静态库？静态库和动态库的区别不在赘述，因为动态库是在启动时进行链接，如果动态库过多就会影响 App 的启动速度，而静态库事直接合并在程序的二进制中，没有这样的问题。之前使用 Swift 第三方库的方案，Cocoapods 通过 `use_frameworks!` 来将第三方打包为动态库使用，但 Cocoapods 现在已经支持了 Swift 静态库，那就更没有理由使用动态库了。
     >
     > 但是主流框架`Mach-O Type`依然设置为`Dynamic Library`

   - 将 `Scheme` 的 `Run` 配置 的`Build Configutation`设置为 `Release`
   - Xcode12 开始模拟器会编译 arm64 架构，在与真机合并时会冲突。

     > 将`Build Setting`的`Excluded Architectures`设置为`Release - Any iOS Simulator SDK - arm64`
     >
     > [参考链接](https://blog.csdn.net/huawt520/article/details/109305833)

   - 将`Build Setting`的`Build Libraries for Distribution`设置为`YES`

     > 这将产生一个模块接口文件，当有人跳转到 Xcode 中的模块定义时，该文件将显示您的公共 API 。
     >
     > 注意 📢：这个设置要在 CocoaPods 更新完成之后，否则编译出来的框架会报错

   - 分别选择模拟器和真机进行编译
   - 定位到项目的`Products`目录, 通过 `lipo -create`命令将模拟器和真机构建的二进制文件进行合并。

     ```shell
     /*
     lipo -create file_path1 file_path2 -output file_path1
     */

     lipo -create xxx/Release-iphoneos/DazooSDK.framework/DazooSDK xxx/Release-iphonesimulator/DazooSDK.framework/DazooSDK -output xxx/Release-iphoneos/DazooSDK.framework/DazooSDK
     ```

     > ```shell
     > // 查看框架支持架构
     > lipo -info xxx/DazooSDK.framework/DazooSDK
     > ```

   - 最后一步
     1. 将`xxx/Release-iphonesimulator/DazooSDK.framework/Modules/DazooSDK.swiftmodule`中所有文件和`xxx/Release-iphonesimulator/DazooSDK.framework/Modules/DazooSDK.swiftmodule/Project`中所有文件复制到真机 framework 对应位置中
     2. 将`xxx/Release-iphonesimulator/DazooSDK.framework/Headers/DazooSDK-Swift.h`内容拼接到真机 framework 对应文件中
        > [参考链接](https://ffairr.com/index.php/2020/06/03/gou-jianswift-heoc-hun-he-de-jing-tai-ku-cun-zai-w/)

2. CocoaPods
3. [SDK 设计](https://juejin.cn/post/6844904131002368008)