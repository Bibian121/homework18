//
//  CellLabelTwoAndImage.swift
//  15MDz
//
//  Created by Matilda Davydov on 16.07.2022.
//

import UIKit
import SnapKit

class CellLabelTwoAndImage: UITableViewCell {
    
    private lazy var labelHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.blackColor
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var labelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.blackColor
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Colors.grayColor
        label.font = UIFont(name: "Inter-Regular", size: 14)
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemGray
        image.contentMode = .scaleToFill
        image.backgroundColor = .systemGray
        image.layer.cornerRadius = 6
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(labelHeader)
        contentView.addSubview(labelText)
        contentView.addSubview(labelTime)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(_ film: Track) {
        labelHeader.text = film.title
        labelText.text = film.description
     //   labelTime.text = viewModel.labelTime
        //image.image = film.image
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.left.equalTo(contentView.snp.left).inset(16)
           // make.right.equalTo(contentView.snp.right).inset(309)
            make.top.equalTo(contentView.snp.top).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(27)
        }
        
        labelHeader.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(58)
            make.left.equalTo(image.snp.right).offset(16)
           // make.right.equalTo(contentView.snp.right).inset(236)
        }
        
        labelText.snp.makeConstraints { make in
            make.top.equalTo(labelHeader.snp.bottom).inset(8)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
            make.left.equalTo(image.snp.right).offset(16)
            make.right.equalTo(contentView.snp.right).inset(16)
            make.height.equalTo(34)
            make.width.equalTo(269)
        }
        
        labelTime.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(2)
            make.bottom.equalTo(contentView.snp.bottom).inset(58)
           // make.left.equalTo(labelHeader.snp.right).offset(170)
            make.right.equalTo(contentView.snp.right).inset(8)
        }
    }
}
