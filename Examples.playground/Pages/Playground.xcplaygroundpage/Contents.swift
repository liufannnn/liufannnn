// Xcode Playground 一直 Running、卡顿、无输出结果
// https://www.jianshu.com/p/3a44597cc0f0

// MARK: - macOS
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

// MARK: - iOS
#if canImport(UIKit)
import UIKit
#endif


