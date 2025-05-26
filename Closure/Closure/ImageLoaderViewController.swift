//
//  ImageLoaderViewController.swift
//  Closure
//
//  Created by 조영현 on 5/26/25.
//

import UIKit

class ImageLoaderViewController: UIViewController {
    private let imageView = UIImageView()
    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    
    private let imageUrl = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdrKa0Z%2FbtsJmayCMkR%2FsLA8rfKaRB8mfIUlxk70y0%2Fimg.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        // ✅ 시작: 이미지 로딩
        loadImage(from: imageUrl) { [weak self] image in
            guard let self = self, let image = image else { return }
            
            self.showImageWithFadeIn(image)
        }
    }

    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0 // 처음에는 숨겨진 상태
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)

        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        loadingIndicator.startAnimating()
    }

    /// ✅ 1. 이미지 다운로드
    private func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {  // 0.7초 딜레이
                self.loadingIndicator.stopAnimating()

                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("❌ 이미지 로딩 실패: \(error?.localizedDescription ?? "알 수 없는 오류")")
                    completion(nil)
                }
            }
        }.resume()
    }

    /// ✅ 2. 애니메이션을 통해 이미지 fade-in
    private func showImageWithFadeIn(_ image: UIImage) {
        imageView.image = image
        UIView.animate(withDuration: 5) {
            self.imageView.alpha = 1
        }
    }
}
