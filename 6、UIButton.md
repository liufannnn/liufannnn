# UIView

## UIButton

### UIEdgeInsets

1. [UIEdgeInsets 详解](https://github.com/noahsark769/NGUIButtonInsetsExample)
2. [UIEdgeInsets 补充解释](https://juejin.cn/post/6844903653380194311)
3. [代码参考](https://github.com/SwifterSwift/SwifterSwift/blob/master/Sources/SwifterSwift/UIKit/UIButtonExtensions.swift)

```swift
import UIKit

@IBDesignable class LayoutButton: UIButton {

    enum Layout: Int {
        case imageLeftTextRight
        case imageRightTextLeft
        case imageAboveText
        case imageBelowText
    }

    @IBInspectable var spacing: CGFloat = 0

    /// 布局方式
    ///
    /// 1. [UIEdgeInsets详解](https://github.com/noahsark769/NGUIButtonInsetsExample)
    /// 2. [UIEdgeInsets补充解释](https://juejin.cn/post/6844903653380194311)
    /// 3. [代码参考](https://github.com/SwifterSwift/SwifterSwift/blob/master/Sources/SwifterSwift/UIKit/UIButtonExtensions.swift)
    var layout = Layout.imageLeftTextRight

    /// 布局方式
    /// - Parameters:
    ///   - 0: 图片左，文本右
    ///   - 1: 图片右，文本左
    ///   - 2: 图片上，文本下
    ///   - 3: 图片下，文本上
    @IBInspectable private var layoutRawValue: Int {
        get { layout.rawValue }
        set {
            layout = Layout(rawValue: newValue) ?? .imageLeftTextRight
            guard let imageSize = imageView?.image?.size,
                  let text = titleLabel?.text,
                  let font = titleLabel?.font else { return }
            switch layout {
            case .imageLeftTextRight:
                let insetAmount = spacing / 2
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
                contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
            case .imageRightTextLeft:
                let insetAmount = spacing / 2
                let titleOffset = -(imageSize.width + insetAmount)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: titleOffset, bottom: 0, right: -titleOffset)

                let titleSize = text.size(withAttributes: [.font: font])
                let imageOffset = -(titleSize.width + insetAmount)
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageOffset, bottom: 0, right: imageOffset)

                contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
            case .imageAboveText:
                let titleSize = text.size(withAttributes: [.font: font])

                let titleOffset = -(imageSize.height + spacing)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: titleOffset, right: 0)

                let imageOffset = -(titleSize.height + spacing)
                imageEdgeInsets = UIEdgeInsets(top: imageOffset, left: 0, bottom: 0, right: -titleSize.width)

                let edgeOffset = abs(titleSize.height - imageSize.height) / 2
                contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0, bottom: edgeOffset, right: 0)
            case .imageBelowText:
                let titleSize = text.size(withAttributes: [.font: font])

                let titleOffset = -(imageSize.height + spacing)
                titleEdgeInsets = UIEdgeInsets(top: titleOffset, left: -imageSize.width, bottom: 0, right: 0)

                let imageOffset = -(titleSize.height + spacing)
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: imageOffset, right: -titleSize.width)

                let edgeOffset = abs(titleSize.height - imageSize.height) / 2
                contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0, bottom: edgeOffset, right: 0)
            }
        }
    }
}

```
