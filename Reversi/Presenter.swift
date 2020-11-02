import Foundation

protocol PresenterProtocol {
    var saveGameUseCase: SaveGameUseCaseProtocol { get }
    var loadGameUseCase: LoadGameUseCaseProtocol { get }
    var countDiskUseCase: CountDiskUseCaseProtocol { get }
    var getAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol { get }
    var placeDiskUseCase: PlaceDiskUseCaseProtocol { get }
}

final class Presenter: PresenterProtocol {
    weak var view: ViewControllerProtocol?
    let saveGameUseCase: SaveGameUseCaseProtocol
    let loadGameUseCase: LoadGameUseCaseProtocol
    let countDiskUseCase: CountDiskUseCaseProtocol
    let getAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol
    let placeDiskUseCase: PlaceDiskUseCaseProtocol

    init(view: ViewControllerProtocol?, saveGameUseCase: SaveGameUseCaseProtocol, loadGameUseCase: LoadGameUseCaseProtocol, countDiskUseCase: CountDiskUseCaseProtocol, getAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol, placeDiskUseCase: PlaceDiskUseCaseProtocol) {
        self.view = view
        self.saveGameUseCase = saveGameUseCase
        self.loadGameUseCase = loadGameUseCase
        self.countDiskUseCase = countDiskUseCase
        self.getAllPossibleCoordinatesByDiskUseCase = getAllPossibleCoordinatesByDiskUseCase
        self.placeDiskUseCase = placeDiskUseCase
    }
}
