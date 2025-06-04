import Figlet
import ArgumentParser
import Foundation

@main
struct MergeMain: ParsableCommand {
  @Argument(help: "First branch name (target branch)")
  public var branch1: String

  @Argument(help: "Second branch name (source branch)")
  public var branch2: String

  public func run() throws {
    let switchToSource = Process()
    switchToSource.launchPath = "/usr/bin/env"
    print("Switching to source branch: \(branch2)")
    switchToSource.arguments = ["git", "switch", branch2]
    switchToSource.launch()
    switchToSource.waitUntilExit()

    let reload = Process()
    reload.launchPath = "/usr/bin/env"
    reload.arguments = ["git", "reload"]
    reload.launch()
    reload.waitUntilExit()

    let switchToTarget = Process()
    switchToTarget.launchPath = "/usr/bin/env"
    print("Switching to source branch: \(branch1)")
    switchToTarget.arguments = ["git", "switch", branch1]
    switchToTarget.launch()
    switchToTarget.waitUntilExit()

    let merge = Process()
    merge.launchPath = "/usr/bin/env"
    merge.arguments = ["git", "merge", branch2]
    merge.launch()
    merge.waitUntilExit()
  }
}