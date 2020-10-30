protocol ValidatePlaceDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address]
}

struct ValidatePlaceDiskUseCase {
    let loadGameUseCase: LoadGameUseCaseProtocol
    let getDiskFromBoardUseCase: GetDiskFromBoardUseCaseProtocol
}

extension ValidatePlaceDiskUseCase {
    func canPlaceDisk(_ disk: Disk, atX x: Int, y: Int) -> Bool {
        !flippedDiskCoordinatesByPlacingDisk(disk, atX: x, y: y).isEmpty
    }

    func flippedDiskCoordinatesByPlacingDisk(_ disk: Disk, atX x: Int, y: Int) -> [(Int, Int)] {
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


        var diskCoordinates: [(Int, Int)] = []

        for direction in directions {
            var x = x
            var y = y

            var diskCoordinatesInLine: [(Int, Int)] = []
            flipping: while true {
                x += direction.x
                y += direction.y

                switch (disk, getDiskFromBoardUseCase.diskAt(x: x, y: y)) { // Uses tuples to make patterns exhaustive
                case (.dark, .some(.dark)), (.light, .some(.light)):
                    diskCoordinates.append(contentsOf: diskCoordinatesInLine)
                    break flipping
                case (.dark, .some(.light)), (.light, .some(.dark)):
                    diskCoordinatesInLine.append((x, y))
                case (_, .none):
                    break flipping
                }
            }
        }

        return diskCoordinates
    }
}

extension ValidatePlaceDiskUseCase: ValidatePlaceDiskUseCaseProtocol {
    func execute(disk: Disk) -> [Address] {
        let board: Board
        do {
             board = try loadGameUseCase.execute()
        } catch {
            return []
        }

        let widthRange: Range<Int> = 0 ..< board.width
        let heigthRange: Range<Int> = 0 ..< board.height
        var coordinates =  [Address]()

        for y in heigthRange {
            for x in widthRange {
                if canPlaceDisk(disk, atX: x, y: y) {
                    coordinates.append(Address(x: x, y: y))
                }
            }
        }

        return coordinates
    }
}
