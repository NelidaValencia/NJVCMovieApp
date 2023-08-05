//
//  NJVCMovieCellView.swift
//  NJVCMovieApp
//
//  Created by Slacker on 14/07/23.
//

import Foundation
import UIKit
import Kingfisher
/// 6. Creamos vista de celda
class NJVCMovieCellView : UITableViewCell {
    let movieImage:  UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieName : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(
            ofSize: 32,
            weight: .bold,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(
            ofSize: 12,
            weight: .regular,
            width: .standard
        )
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(movieImage)
        addSubview(movieName)
        addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            movieImage.heightAnchor.constraint(equalToConstant: 200),
            movieImage.widthAnchor.constraint(equalToConstant: 100),
//            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 12),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieName.topAnchor.constraint(equalTo: movieImage.topAnchor, constant: 24),
            
            movieDescription.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
            movieDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
        ])
    }
    
    func configure(model: ViewModel) {
        movieImage.kf.setImage(with: model.poster_path)
        movieName.text = model.title
        movieDescription.text = model.overview
    }
    
}
