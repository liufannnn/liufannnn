//
//  XCTestExtensions.swift
//  LiuFanTests
//
//  Created by 刘帆 on 2023/3/31.
//

#if canImport(XCTest)
import XCTest

#if canImport(UIKit)
import UIKit
/// Color
public typealias LFColor = UIColor
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
/// Color
public typealias LFColor = NSColor
#endif

#if canImport(AppKit) || canImport(UIKit)
/// 断言两个 `Color` 的 RGBA 值在一定的精度内相等
/// - Parameters:
///   - expression1: A `Color`.
///   - expression2: A `Color`.
///   - accuracy: 描述 `expression1` 和 `expression2` 这两个值相等时的最大差异
///   - message: An optional description of the failure.
public func XCTAssertEqual(_ expression1: @autoclosure () throws -> LFColor,
                           _ expression2: @autoclosure () throws -> LFColor,
                           accuracy: CGFloat,
                           _ message: @autoclosure () -> String = "",
                           file: StaticString = #file,
                           line: UInt = #line) {
    var color1: LFColor!
    XCTAssertNoThrow(color1 = try expression1(), message(), file: file, line: line)
    var color2: LFColor!
    XCTAssertNoThrow(color2 = try expression2(), message(), file: file, line: line)
    var red1: CGFloat = 0, green1: CGFloat = 0, blue1: CGFloat = 0, alpha1: CGFloat = 0
    var red2: CGFloat = 0, green2: CGFloat = 0, blue2: CGFloat = 0, alpha2: CGFloat = 0
    color1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
    color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
    XCTAssertEqual(red1, red2, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(green1, green2, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(blue1, blue2, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(alpha1, alpha2, accuracy: accuracy, message(), file: file, line: line)
}
#endif

#if canImport(CoreGraphics)
/// 断言两个 `CGAffineTransform` 的 RGBA 值在一定的精度内是相等的
/// - Parameters:
///   - expression1: A `CGAffineTransform`.
///   - expression2: A `CGAffineTransform`.
///   - accuracy: 描述 `expression1` 和 `expression2` 这两个值相等时的最大差异
///   - message: An optional description of the failure.
public func XCTAssertEqual(_ expression1: @autoclosure () throws -> CGAffineTransform,
                           _ expression2: @autoclosure () throws -> CGAffineTransform,
                           accuracy: CGFloat,
                           _ message: @autoclosure () -> String = "",
                           file: StaticString = #file,
                           line: UInt = #line) {
    var transform1: CGAffineTransform!
    XCTAssertNoThrow(transform1 = try expression1(), message(), file: file, line: line)
    var transform2: CGAffineTransform!
    XCTAssertNoThrow(transform2 = try expression2(), message(), file: file, line: line)
    XCTAssertEqual(transform1.a, transform2.a, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(transform1.b, transform2.b, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(transform1.c, transform2.c, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(transform1.d, transform2.d, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(transform1.tx, transform2.tx, accuracy: accuracy, message(), file: file, line: line)
    XCTAssertEqual(transform1.ty, transform2.ty, accuracy: accuracy, message(), file: file, line: line)
}
#endif

#endif
