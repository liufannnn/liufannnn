//
//  LayoutButton.swift
//  LiuFan-iOS
//
//  Created by 刘帆 on 2023/3/28.
//

import UIKit

extension LayoutButton {

    /// 图片与文本的布局方向
    public enum LayoutDirection: Int {
        /// 图片左，文本右
        case imageLeftTextRight
        /// 图片右，文本左
        case imageRightTextLeft
        /// 图片上，文本下
        case imageAboveText
        /// 图片下，文本上
        case imageBelowText
    }

    public struct Layout {
        /// 布局方向
        public var direction: LayoutDirection
        /// 间距
        public var spacing: CGFloat

        public init(direction: LayoutDirection, spacing: CGFloat) {
            self.direction = direction
            self.spacing = spacing
        }
    }
}

/// 可以调整图片与文本布局的按钮
@IBDesignable public final class LayoutButton: UIButton {

    /// 布局
    ///
    /// 默认：图片左，文本右，间距 0
    ///
    /// 1. [UIEdgeInsets详解](https://github.com/noahsark769/NGUIButtonInsetsExample)
    /// 2. [UIEdgeInsets补充解释](https://juejin.cn/post/6844903653380194311)
    public var layout = Layout(direction: .imageLeftTextRight, spacing: 0) {
        didSet {
            guard let imageSize = imageView?.image?.size,
                  let text = titleLabel?.text,
                  let font = titleLabel?.font else { return }
            switch layout.direction {
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

    /// 图片与文本的布局方向
    /// - Parameters:
    ///   - 0: 图片左，文本右
    ///   - 1: 图片右，文本左
    ///   - 2: 图片上，文本下
    ///   - 3: 图片下，文本上
    @IBInspectable private var layoutDirection: Int {
        get {
            return layout.direction.rawValue
        }
        set {
            layout.direction = LayoutDirection(rawValue: newValue) ?? .imageLeftTextRight
        }
    }

    /// 图片与文本的间距
    @IBInspectable private var spacing: CGFloat {
        get {
            return layout.spacing
        }
        set {
            layout.spacing = newValue
        }
    }
}
