// Xcode Playground 一直 Running、卡顿、无输出结果
// https://www.jianshu.com/p/3a44597cc0f0

import LiuFan
import PlaygroundSupport

#if canImport(UIKit) && !os(watchOS)
import UIKit

//: # 可以调整图片与文本布局的按钮

let button = LayoutButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
button.setImage(UIImage(named: "右箭头.png"), for: .normal)
button.setTitle("右箭头", for: .normal)
button.layout = LayoutButton.Layout(direction: .imageAboveText, spacing: 5)
#endif

