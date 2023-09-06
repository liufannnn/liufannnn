//
//  XCTestExtensionsTests.swift
//  LiuFanTests
//
//  Created by 刘帆 on 2023/3/31.
//

@testable import LiuFan
import XCTest

final class XCTestExtensionsTests: XCTestCase {
    #if canImport(AppKit) || canImport(UIKit)
    func testAssertEqualColorsWithAccuracy() {
        XCTAssertEqual(.blue, .blue, accuracy: 0)

        let accuracy = CGFloat(0.1)
        XCTAssertEqual(LFColor(red: 0, green: 0, blue: 0, alpha: 0),
                       LFColor(red: accuracy, green: 0, blue: 0, alpha: 0),
                       accuracy: accuracy)
        XCTAssertEqual(LFColor(red: 0, green: 0, blue: 0, alpha: 0),
                       LFColor(red: 0, green: accuracy, blue: 0, alpha: 0),
                       accuracy: accuracy)
        XCTAssertEqual(LFColor(red: 0, green: 0, blue: 0, alpha: 0),
                       LFColor(red: 0, green: 0, blue: accuracy, alpha: 0),
                       accuracy: accuracy)
        XCTAssertEqual(LFColor(red: 0, green: 0, blue: 0, alpha: 0),
                       LFColor(red: 0, green: 0, blue: 0, alpha: accuracy),
                       accuracy: accuracy)
    }
    #endif
}
