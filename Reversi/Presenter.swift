import Foundation

protocol PresenterProtocol {

}

final class Presenter {
    let saveGameUseCase: SaveGameUseCaseProtocol
    let loadGameUseCase: LoadGameUseCaseProtocol
    let countDiskUseCase: CountDiskUseCaseProtocol
    let getAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol
    let placeDiskUseCase: PlaceDiskUseCaseProtocol

    init(saveGameUseCase: SaveGameUseCaseProtocol, loadGameUseCase: LoadGameUseCaseProtocol, countDiskUseCase: CountDiskUseCaseProtocol, getAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol, placeDiskUseCase: PlaceDiskUseCaseProtocol) {
        self.saveGameUseCase = saveGameUseCase
        self.loadGameUseCase = loadGameUseCase
        self.countDiskUseCase = countDiskUseCase
        self.getAllPossibleCoordinatesByDiskUseCase = getAllPossibleCoordinatesByDiskUseCase
        self.placeDiskUseCase = placeDiskUseCase
    }
}

extension Presenter: PresenterProtocol {

}
