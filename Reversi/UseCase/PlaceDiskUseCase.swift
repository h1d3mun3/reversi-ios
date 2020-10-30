protocol PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) -> Board
}

struct PlaceDiskUseCase {

}

extension PlaceDiskUseCase: PlaceDiskUseCaseProtocol {
    func placeDisk(disk: Disk, address: Address) -> Board {
        return Board(height: 0, width: 0, blackPlayerStatus: .manual, whitePlayerStatus: .human, currentPlayDisk: .black, blackCells: [], whiteCells: [])
    }
}
