import AppleScriptLib
import XCTest

final class OutputsTests: XCTestCase {

  func testBoolean() throws {
    let script = try AppleScript(source: "return true")
    XCTAssertTrue(try script())
  }

  func testString() throws {
    let script = try AppleScript(source: #"return "potato""#)
    XCTAssertEqual("potato", try script())
  }

  func testInt32() throws {
    let script = try AppleScript(source: "return 3")
    XCTAssertEqual(3, try script())
  }
}