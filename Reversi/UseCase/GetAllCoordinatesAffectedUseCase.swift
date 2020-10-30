protocol GetAllCoordinatesAffectedUseCaseProtocol {
    func flippedDiskCoordinatesByPlacingDisk(_ disk: Disk, atX x: Int, y: Int) -> [Address]
}

struct GetAllCoordinatesAffectedUseCase {
    let getDiskFromBoardUseCase: GetDiskFromBoardUseCaseProtocol
}

extension GetAllCoordinatesAffectedUseCase: GetAllCoordinatesAffectedUseCaseProtocol {
    func flippedDiskCoordinatesByPlacingDisk(_ disk: Disk, atX x: Int, y: Int) -> [Address] {
        let directions = [
            (x: -1, y: -1),
            (x:  0, y: -1),
            (x:  1, y: -1),
            (x:  1, y:  0),
            (x:  1, y:  1),
            (x:  0, y:  1),
            (x: -1, y:  0),
            (x: -1, y:  1),
        ]

        guard getDiskFromBoardUseCase.diskAt(x: x, y: y) == nil else {
            return []
        }


        var diskCoordinates: [Address] = []

        for direction in directions {
            var x = x
            var y = y

            var diskCoordinatesInLine: [Address] = []
            flipping: while true {
                x += direction.x
                y += direction.y

                switch (disk, getDiskFromBoardUseCase.diskAt(x: x, y: y)) { // Uses tuples to make patterns exhaustive
                case (.dark, .some(.dark)), (.light, .some(.light)):
                    diskCoordinates.append(contentsOf: diskCoordinatesInLine)
                    break flipping
                case (.dark, .some(.light)), (.light, .some(.dark)):
                    diskCoordinatesInLine.append(Address(x: x, y: y))
                case (_, .none):
                    break flipping
                }
            }
        }

        return diskCoordinates
    }
}
