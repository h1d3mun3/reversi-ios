import Foundation

struct Board: Codable {
    let height: Int
    let width: Int
    let blackPlayerStatus: PlayerStatus
    let whitePlayerStatus: PlayerStatus
    let currentPlayDisk: Disk
    let blackCells: [Address]
    let whiteCells: [Address]
}
