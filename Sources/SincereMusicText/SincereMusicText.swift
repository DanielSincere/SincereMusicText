import Foundation
import SincerePath
import AppleMusicLib

@main
struct SincereMusicText {

  static func main() throws {
    
    let dir: SincerePath = .home + "Documents/streaming.live"
    let path = dir + "current-state.txt"
    try dir.createDirectories()
    try path.clear()
    
    let appleMusic = try AppleMusic()
    while true {
      do {
        let state = try appleMusic.currentState().description
        print(state)
        try path.write(state, encoding: .utf8)

        sleep(5)
      } catch {
        print(error)
      }
    }
  }
}
