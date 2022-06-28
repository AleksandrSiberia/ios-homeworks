//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Александр Хмыров on 03.06.2022.
//

import UIKit

final class ProfileHeaderView: UITableViewHeaderFooterView {



    lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.backgroundColor = .systemGray4
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 1
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()

    private lazy var topStack: UIStackView = {
        var topStack: UIStackView = UIStackView()
        topStack.axis = .vertical
        topStack.spacing = 4
        topStack.distribution = .fillEqually
        topStack.translatesAutoresizingMaskIntoConstraints = false
        return topStack
    }()

    private lazy var fullNameLabel: UILabel = {
        var titleLabel: UILabel = UILabel()
        titleLabel.text = "AleksandrSiberia"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return titleLabel
    }()

    private lazy var statusLabel: UILabel = {
        var statusLabel: UILabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        return statusLabel
    }()

    private lazy var statusTextField: UITextField = {
        var statusTextField: UITextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.delegate = self
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        return statusTextField
    }()

    private lazy var setStatusButton: UIButton = {
        var statusButton: UIButton = UIButton()
        statusButton.backgroundColor = .blue
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Поменять статус", for: .normal)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.cornerRadius = 12
        return statusButton
    }()

    private lazy var statusText: String = {
        return ""
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
        self.setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
            }

    private func setupGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGestureRecognizer(_:)))
        self.avatarImageView.addGestureRecognizer(tapGestureRecognizer) }

    func setFirtResponder() {
        self.statusTextField.becomeFirstResponder()
    }

    private func setupView() {

        self.topStack.addArrangedSubview(self.fullNameLabel)
        self.topStack.addArrangedSubview(self.statusLabel)

        [avatarImageView, topStack, statusTextField, setStatusButton].forEach({self.addSubview($0)})
        self.insertSubview(avatarImageView, at: 3)
    }


    private func setupConstraints() {
        NSLayoutConstraint.activate([
        self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),

        self.topStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
        self.topStack.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
        self.topStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        self.topStack.bottomAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: -18),

        self.statusTextField.topAnchor.constraint(equalTo: topStack.bottomAnchor),
        self.statusTextField.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
        self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        self.statusTextField.heightAnchor.constraint(equalToConstant: 40),

        self.setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 18),
        self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }

    private func basicAnimation() {
        let screenMain = UIScreen.main.bounds
        let startPoint = self.avatarImageView.center

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut) {

            self.avatarImageView.center = CGPoint(x: screenMain.width / 2.0, y: screenMain.height / 2.0)
        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveLinear) {

                self.avatarImageView.transform = CGAffineTransform(scaleX: 2, y: 2)

        }  completion: { _ in
        //    self.avatarImageView.transform = .identity
        //    self.avatarImageView.center = startPoint

        }
    }
    }

    private func frameAnimation() {
        let screenMain = UIScreen.main.bounds

        UIView.animateKeyframes(withDuration: 4.0,
                                delay: 0,
                                options: .calculationModeCubic) {

            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 2.0) {
                self.avatarImageView.center = CGPoint(x: screenMain.width / 2, y: screenMain.height / 2)
            }


            UIView.addKeyframe(withRelativeStartTime: 2.0,
                               relativeDuration: 4.0) {
                self.avatarImageView.center = CGPoint(x: screenMain.width / 2 + 150, y: screenMain.height / 2)
            }
        }
    }

    private func layerAnimation() {

            CATransaction.begin()

            CATransaction.setCompletionBlock {
                self.avatarImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            }

            let startPosition = avatarImageView.center
            let screen = UIScreen.main.bounds

            let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
            animation.fromValue = startPosition
            animation.toValue = CGPoint(x: screen.width / 2, y: screen.height / 2)

            animation.duration = 0.5
            animation.repeatCount = 2
            animation.isRemovedOnCompletion = true
            animation.autoreverses = true
            self.avatarImageView.layer.add(animation, forKey: #keyPath(CALayer.position))
            CATransaction.commit()
    }

    @objc private func handleTapGestureRecognizer(_ gesture: UITapGestureRecognizer) {

        let startPosition = avatarImageView.center
        let screen = UIScreen.main.bounds
        
     //   layerAnimation()
   //     frameAnimation()
    //    basicAnimation()


    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print(statusText)
    }

    @objc private func statusTextChanged(_ TextField: UITextField) {
        let statusTextField: UITextField = TextField
        if let text = statusTextField.text  {
            statusText = text
        }
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
}


