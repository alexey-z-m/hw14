import Foundation
import UIKit

struct AlbumType {
    let title: String
    let image: UIImage?
    let countPhoto: String
}

struct Sections {
    let title: String
    let albums: [AlbumType]
}

class Model {
    static func getModels() -> [Sections]{
        var models = [Sections]()
        let myAlbums: [AlbumType]  = [
            AlbumType(title: "Cats", image: UIImage(named:"image1"), countPhoto: "123"),
            AlbumType(title: "kitties", image: UIImage(named:"image2"), countPhoto: "2342"),
            AlbumType(title: "more cats", image: UIImage(named:"image3"), countPhoto: "12"),
            AlbumType(title: "cat", image: UIImage(named:"image4"), countPhoto: "865"),
            AlbumType(title: "CATS!", image: UIImage(named:"image5"), countPhoto: "1233"),
            AlbumType(title: "kitty", image: UIImage(named:"image6"), countPhoto: "457"),
            AlbumType(title: "🐱", image: UIImage(named:"image7"), countPhoto: "679"),
            AlbumType(title: "Cats", image: UIImage(named:"image1"), countPhoto: "123"),
            AlbumType(title: "kitties", image: UIImage(named:"image2"), countPhoto: "2342"),
            AlbumType(title: "more cats", image: UIImage(named:"image3"), countPhoto: "12"),
            AlbumType(title: "cat", image: UIImage(named:"image4"), countPhoto: "865"),
            AlbumType(title: "CATS!", image: UIImage(named:"image5"), countPhoto: "1233"),
            AlbumType(title: "kitty", image: UIImage(named:"image6"), countPhoto: "457"),
            AlbumType(title: "🐱", image: UIImage(named:"image7"), countPhoto: "679")
        ].compactMap({$0})
        let shareAlbums: [AlbumType]  = [
            AlbumType(title: "(^˵◕ω◕˵^)", image: UIImage(named:"image8"), countPhoto: "789"),
            AlbumType(title: "one more", image: UIImage(named:"image9"), countPhoto: "999"),
            AlbumType(title: "..cats", image: UIImage(named:"image10"), countPhoto: "87")
        ].compactMap({$0})
        models.append(Sections(title: "My Albums", albums: myAlbums))
        models.append(Sections(title: "Shared Albums", albums: shareAlbums))
        
        return models
    }
}
