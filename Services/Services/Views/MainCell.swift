//
//  MainCell.swift
//  Services
//
//  Created by Кирилл Давыденков on 30.03.2024.
//

import UIKit

class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let iconImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        setupIconImageView()
        setupNameLabel()
        setupDescriptionLabel()
    }
    
    private func setupIconImageView() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            iconImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 0)
        ])
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configureCell(viewModel: MainCellViewModel) {
        viewModel.loadImage { image in
            DispatchQueue.main.async {
                self.iconImageView.image = image
            }
        }
        
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        
        if viewModel.name == "Юла" {
            nameLabel.text = viewModel.name + " ❤️❤️❤️"
        }
    }
}
