import Foundation
import SincerePath
import AppleMusicLib
import ArgumentParser

@main
struct SincereMusicText: ParsableCommand {
  
  @Option()
  var interval: UInt32 = 5
  
  func run() throws {
    
    let dir: SincerePath = .home + "Documents/streaming.live"
    let path = dir + "current-state.txt"
    try dir.createDirectories()
    try path.clear()
    
    let appleMusic = try AppleMusic()
    var state: AppleMusicState? = nil
    while true {
      do {
        let newState = try appleMusic.currentState()
        if newState != state {
          try path.write(newState.description, encoding: .utf8)
          print(newState.description)
          state = newState
        }
        sleep(interval)
      } catch {
        print(error)
      }
    }
  }
}
