1. [使用 AutoLayout 之后什么时候才能获得正确的 frame](https://blog.csdn.net/aywb1314/article/details/52816165)

   ```swift
   // 注意 viewDidLayoutSubviews 可能会被多次调用，所以添加元素之类的操作尽量避免在这里做
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
   ```

2. 让 IB/StoryBoard 的约束和字体大小自适应屏幕尺寸

   ```swift
   private var kScreenAdaptationConstantKey = 901234
   extension NSLayoutConstraint {
       /// 以 iPhone 14 Pro 为基准的屏幕适配
       ///
       /// [参考链接](https://www.jianshu.com/p/3aa04087d2d8)
       @IBInspectable var screenAdaptationConstant: CGFloat {
            get {
                guard let value = objc_getAssociatedObject(self, &kScreenAdaptationConstantKey) as? CGFloat else { return constant }
                return value
            }
            set {
                constant = UIScreen.main.bounds.width / 393 * screenAdaptationConstant
                objc_setAssociatedObject(self, &kScreenAdaptationConstantKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
   ```
