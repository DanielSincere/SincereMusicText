@testable import AppleMusicLib
import XCTest

final class CompilationTests: XCTestCase {

  func testAppleMusicInitializesWithoutThrowing() throws {
    _ = try AppleMusic()
  }
}
