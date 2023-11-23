//
//  CustomBossView.swift
//  AlienDestroyer
//
//  Created by Кирилл Щёлоков on 19.11.2023.
//

import UIKit

class CustomBossView: UIView, EntityProtocol, WeaponProtocol {
    var health: Int = 5
    var atackSpeed: Double = 1.5
    var damage: Int = 10

    let explosionImages = [
        "ExplosionImage1",
        "ExplosionImage2",
        "ExplosionImage3",
        "ExplosionImage4",
        "ExplosionImage5",
        "ExplosionImage6",
        "ExplosionImage7"]

    private lazy var bossImageView: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpViews() {
        setUpAlienImageView()
    }

    private func setUpAlienImageView() {
        addSubview(bossImageView)
        bossImageView.image = UIImage(named: "bossexp")
        bossImageView.contentMode = .scaleAspectFit
        bossImageView.clipsToBounds = true
        bossImageView.translatesAutoresizingMaskIntoConstraints = false
        bossImageView.transform = CGAffineTransform(rotationAngle: .pi / 2)

        NSLayoutConstraint.activate([
            bossImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            bossImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            bossImageView.heightAnchor.constraint(equalToConstant: 80),
            bossImageView.widthAnchor.constraint(equalToConstant: 128)
        ])
    }

    public func makeExplosion() {
        let images = explosionImages.compactMap { UIImage(named: $0) }
        createAnimation(imageView: bossImageView, images: images, duration: 0.4) { [weak self] in
            self?.removeFromSuperview()
        }
    }

    private func createAnimation(imageView: UIImageView, images: [UIImage], duration: TimeInterval, completion: (() -> Void)?) {
        imageView.animationImages = images
        imageView.animationDuration = duration
        imageView.animationRepeatCount = 1
        imageView.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + duration - 0.1) {
            completion?()
        }
    }

}
