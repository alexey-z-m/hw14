//
//  TableViewCell.swift
//  hw14
//
//  Created by Panda on 15.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    private var iconImage: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    private var subLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: Item) {
        iconImage.image = model.image
        iconImage.snp.makeConstraints { make in
           // make.left.top.bottom.equalToSuperview()
        }
        contentView.addSubview(iconImage)
        label.text = model.title
        label.snp.makeConstraints { make in
            //make.top.bottom.equalToSuperview()
           // make.left.equalTo(iconImage.snp.right)
        }
        contentView.addSubview(label)
        subLabel.text = model.countPhoto
        subLabel.snp.makeConstraints { make in
           // make.top.right.bottom.equalToSuperview()
        }
        contentView.addSubview(subLabel)
    }

}
