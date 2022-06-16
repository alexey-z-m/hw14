import UIKit

class SharedAlbumsCollectionViewCell: UICollectionViewCell {
    static let identifier = "SharedAlbumsCollectionViewCell"
    private var albumsCollectionView: UICollectionView!
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    private let labelNameAlbum: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let labelCountPhotoInAlbum: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with model: Item) {
        imageView.image = model.image
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width)
            make.left.top.right.equalToSuperview()
        }
        labelNameAlbum.text = model.title
        contentView.addSubview(labelNameAlbum)
        labelNameAlbum.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
        }
        labelCountPhotoInAlbum.text = model.countPhoto
        contentView.addSubview(labelCountPhotoInAlbum)
        labelCountPhotoInAlbum.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(labelNameAlbum.snp.bottom).offset(5)
        }
    }
}



