import Foundation
import SincerePath

@main
struct SincereMusicText {

  static func main() throws {
    
    let dir: SincerePath = .home + "Documents/streaming.live"
    let path = dir + "current-song.txt"
    try dir.createDirectories()
    try path.clear()
    
    
    let appleMusic = try AppleMusic()
    while true {
      do {
        let state = try appleMusic.current().description
        print(state)
        try path.write(state, encoding: .utf8)

        sleep(5)
      } catch {
        print(error)
      }
    }
  }
}
