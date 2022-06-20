import Foundation
import UIKit

struct Item: Hashable {
    let title: String
    let image: UIImage?
    let countPhoto: String
}

//struct Sections {
//    let title: String
//    let albums: [AlbumItem]
//}

enum Section: String, CaseIterable {
    case myAlbums = "My Albums"
    case sharedAlbums = "Shared Albums"
    case table = "Utilities"
}

class Model {
    static func itemForCollection(section: Section) -> [Item] {
        switch section {
        case .myAlbums:
            return [
                Item(title: "Cats", image: UIImage(named:"image1"), countPhoto: "123"),
                Item(title: "kitties", image: UIImage(named:"image2"), countPhoto: "2342"),
                Item(title: "more cats", image: UIImage(named:"image3"), countPhoto: "12"),
                Item(title: "cat", image: UIImage(named:"image4"), countPhoto: "865"),
                Item(title: "CATS!", image: UIImage(named:"image5"), countPhoto: "1233"),
                Item(title: "kitty", image: UIImage(named:"image6"), countPhoto: "457"),
                Item(title: "🐱", image: UIImage(named:"image7"), countPhoto: "679")
            ]
        case .sharedAlbums:
            return [
                Item(title: "(^˵◕ω◕˵^)", image: UIImage(named:"image8"), countPhoto: "789"),
                Item(title: "one more", image: UIImage(named:"image9"), countPhoto: "999"),
                Item(title: "..cats", image: UIImage(named:"image10"), countPhoto: "87")
            ]
        case .table:
            return [
                Item(title: "Imports", image: UIImage(systemName: "square.and.arrow.down"), countPhoto: "789"),
                Item(title: "Hidden", image: UIImage(systemName: "eye.slash"), countPhoto: "999"),
                Item(title: "Recently Deleted", image: UIImage(systemName: "trash"), countPhoto: "87")
            ]
        }
    }
}
