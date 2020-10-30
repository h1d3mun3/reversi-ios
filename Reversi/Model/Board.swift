struct Board {
    let height: Int
    let width: Int
    let blackPlayerStatus: PlayerStatus
    let whitePlayerStatus: PlayerStatus
    let currentPlayDisk: DiskNew
    let blackCells: [Address]
    let whiteCells: [Address]
}
