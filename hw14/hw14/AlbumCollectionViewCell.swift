import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumCollectionViewCell"
    
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
        label.textColor = .black
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
    
    public func configure(with model: AlbumType) {
        imageView.image = model.image
        labelNameAlbum.text = model.title
        labelCountPhotoInAlbum.text = model.countPhoto
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(labelNameAlbum)
        contentView.addSubview(labelCountPhotoInAlbum)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        labelNameAlbum.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
        }
        labelCountPhotoInAlbum.snp.makeConstraints { make in
            make.top.equalTo(labelNameAlbum.snp.bottom).offset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
