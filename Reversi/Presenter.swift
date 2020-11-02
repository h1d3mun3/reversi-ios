import Foundation

protocol PresenterProtocol {
    var saveGameUseCase: SaveGameUseCaseProtocol { get }
    var loadGameUseCase: LoadGameUseCaseProtocol { get }
    var countDiskUseCase: CountDiskUseCaseProtocol { get }
    var getAllPossibleCoordinatesByDiskUseCase: GetAllPossibleCoordinatesByDiskUseCaseProtocol { get }
    var placeDiskUseCase: PlaceDiskUseCaseProtocol { get }

    func viewDidLoad()
}

protocol PresenterCompatibilityProtocol {
    var path: String { get }
    var turn: Disk? { get set }

    func newGame()
    func saveGame(board: Board) throws
    func loadGame() throws
}
final class Presenter: PresenterProtocol, PresenterCompatibilityProtocol {
    var board: Board!
    /// どちらの色のプレイヤーのターンかを表します。ゲーム終了時は `nil` です。
    var turn: Disk? = .dark

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
extension Presenter {
    var path: String {
        (NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! as NSString).appendingPathComponent("Game")
    }
}

extension Presenter {
    /// ゲームの状態を初期化し、新しいゲームを開始します。
    func newGame() {
        board = Board(height: 8,
                      width: 8,
                      blackPlayerStatus: .manual,
                      whitePlayerStatus: .computer,
                      currentPlayDisk: .dark,
                      blackCells: [Address(x:4, y:3), Address(x:3, y:4)],
                      whiteCells: [Address(x:3, y:3), Address(x:4, y:4)]
        )

        turn = .dark

        try? saveGame(board: board)

        view?.updatedBoard(board: board, turn: turn)
    }

    /// ゲームの状態をファイルに書き出し、保存します。
    func saveGame(board: Board) throws {
        do {
            try saveGameUseCase.execute(board: board)
        } catch let error {
            throw FileIOError.read(path: path, cause: error)
        }
    }

    /// ゲームの状態をファイルから読み込み、復元します。
    func loadGame() throws {
        board = try loadGameUseCase.execute()

        turn = board.currentPlayDisk

        view?.updatedBoard(board: board, turn: turn)
    }
}

extension Presenter {
    func viewDidLoad() {
        do {
            try loadGame()
        } catch _ {
            newGame()
        }
    }
}

enum FileIOError: Error {
    case write(path: String, cause: Error?)
    case read(path: String, cause: Error?)
}
