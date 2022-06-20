import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    static let identifier = "TableCollectionViewCell"
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let imageIconArrow: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .gray
        return image
    }()
    
    private let labelNameAlbum: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .blue
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let labelCountPhotoInAlbum: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let viewLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    public func configure(with model: Item) {
        imageView.image = model.image
        labelNameAlbum.text = model.title
        labelCountPhotoInAlbum.text = model.countPhoto
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(viewLine)
        contentView.addSubview(imageView)
        contentView.addSubview(labelNameAlbum)
        contentView.addSubview(labelCountPhotoInAlbum)
        contentView.addSubview(imageIconArrow)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewLine.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(1)
        }
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
        }
        labelNameAlbum.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(30)
        }
        imageIconArrow.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        labelCountPhotoInAlbum.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(imageIconArrow.snp.left).offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

