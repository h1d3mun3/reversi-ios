import Foundation

struct Board: Codable {
    let height: Int
    let width: Int
    let blackPlayerStatus: Player
    let whitePlayerStatus: Player
    let currentPlayDisk: Disk
    var blackCells: [Address]
    var whiteCells: [Address]

    func count(disk: Disk) -> Int? {
        switch disk {
        case .dark:
            return blackCells.count
        case .light:
            return whiteCells.count
        }
    }

    func diskAt(x: Int, y: Int) -> Disk? {
        guard let matcheAddres = (blackCells + whiteCells)
            .filter ({ (address) -> Bool in
                return address.x == x && address.y == y
            }).first  else {
                return nil
        }

        if blackCells.contains(matcheAddres) {
            return .dark
        } else if whiteCells.contains(matcheAddres) {
            return .light
        } else {
            return nil
        }
    }

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

        guard diskAt(x: x, y: y) == nil else {
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

                switch (disk, diskAt(x: x, y: y)) { // Uses tuples to make patterns exhaustive
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

    func getAllPossibleCoordinatesByDisk(disk: Disk) -> [Address] {
        let widthRange: Range<Int> = 0 ..< width
        let heigthRange: Range<Int> = 0 ..< height
        var coordinates =  [Address]()

        for y in heigthRange {
            for x in widthRange {
                if !flippedDiskCoordinatesByPlacingDisk(disk, atX: x, y: y).isEmpty {
                    coordinates.append(Address(x: x, y: y))
                }
            }
        }

        return coordinates
    }

    mutating func placeDisk(disk: Disk, address: Address) throws {
        let coodinatesAffected = flippedDiskCoordinatesByPlacingDisk(disk, atX: address.x, y: address.y)

        let oldBlackCells = blackCells
        let oldWhiteCells = whiteCells

        blackCells = [Address]()
        whiteCells = [Address]()
        switch disk {
        case .dark:
            blackCells += oldBlackCells
            blackCells += coodinatesAffected.filter({ !oldBlackCells.contains($0) })
            blackCells.append(address)

            whiteCells += oldWhiteCells.filter({ !coodinatesAffected.contains($0) })
        case .light:
            whiteCells += oldWhiteCells
            whiteCells += coodinatesAffected.filter({ !oldWhiteCells.contains($0) })
            whiteCells.append(address)

            blackCells += oldBlackCells.filter({ !coodinatesAffected.contains($0) })
        }
    }
}
