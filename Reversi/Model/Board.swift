import Foundation

struct Board: Codable {
    let height: Int
    let width: Int
    let blackPlayerStatus: Player
    let whitePlayerStatus: Player
    let currentPlayDisk: Disk
    let blackCells: [Address]
    let whiteCells: [Address]
}
