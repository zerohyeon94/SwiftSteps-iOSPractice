//
//  FirstViewController.swift
//  ViewLifeCycle
//
//  Created by 조영현 on 5/19/25.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let goToNextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    // 생성자 (초기화)
    init() {
        super.init(nibName: nil, bundle: nil)
        print("[FirstVC] init")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("[FirstVC] init(coder:)")
    }

    // 뷰 로딩 (뷰를 코드로 구성하는 경우 필요)
    override func loadView() {
        super.loadView()
        print("[FirstVC] loadView")
    }

    // 뷰가 메모리에 로드되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[FirstVC] viewDidLoad")

        view.backgroundColor = .white
        
        setupUI()
        setupConstraints()
    }

    // 뷰가 나타나기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[FirstVC] viewWillAppear")
    }

    // 뷰가 완전히 나타난 직후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[FirstVC] viewDidAppear")
    }

    // 뷰가 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[FirstVC] viewWillDisappear")
    }

    // 뷰가 완전히 사라진 직후
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[FirstVC] viewDidDisappear")
    }

    // 메모리 해제 시점
    deinit {
        print("[FirstVC] deinit")
    }
    
    private func setupUI() {
        goToNextButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        view.addSubview(goToNextButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            goToNextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToNextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goToNextButton.widthAnchor.constraint(equalToConstant: 120),
            goToNextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // 다음 화면으로 이동
    @objc private func goToNext() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}


