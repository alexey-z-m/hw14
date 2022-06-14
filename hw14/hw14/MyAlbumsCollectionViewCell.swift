import UIKit

class MyAlbumsCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyAlbumsCollectionViewCell"
    
    private var albumsCollectionView: UICollectionView!
    
    private let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private var model: [AlbumType] = [AlbumType]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        setupColectionView()
        someView.addSubview(albumsCollectionView)
        albumsCollectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with models: [AlbumType]) {
        model = models
    }
    
    func setupColectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let size = contentView.frame.width
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(
            width: size/2 - 15,
            height: size/2 + 35
        )
        albumsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        albumsCollectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        albumsCollectionView.showsHorizontalScrollIndicator = false
        //albumsCollectionView.delegate = self
        albumsCollectionView.dataSource = self
    }
}

extension MyAlbumsCollectionViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = model[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AlbumCollectionViewCell.identifier,
            for: indexPath
        ) as? AlbumCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
}



