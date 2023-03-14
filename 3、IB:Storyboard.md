## IB/Storyboard

1. [利用 `unwind segue` 在页面间回传数据](https://medium.com/彼得潘的試煉-勇者的-100-道-swift-ios-app-謎題/利用-unwind-segue-將表格選擇的結果回傳-app-功能實作解密-1-c66a731f9380)
2. [iOS13 新特性之 `@IBSegueAction`](https://juejin.cn/post/6844904016376233992)

   ```swift
   // 1、storyboard.instantiateViewController方法多了一个creator参数
   // 2、@IBSegueAction方法具有三个参数。必需的NSCoder参数以及可选的sender和segueIdentifier

   @IBSegueAction
   private func showPreview(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> PreviewController? {
        return PreviewController(coder: coder, book: book)
   }
   ```