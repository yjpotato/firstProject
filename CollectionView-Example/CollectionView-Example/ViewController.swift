//
//  ViewController.swift
//  CollectionView-Example
//
//  Created by 정유진 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    var colors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink,
                             .systemOrange, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink,
                             .systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink,
                             .systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink]
    
    let flowLayout = UICollectionViewFlowLayout()//디자인이 어떤 방식으로 들어올지 설정하는 애!
    
    lazy var  collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()//빠트리면 실행했을때 아무것도 안보임. 잊지말기!!
        addGesture()//함수호출~
        
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)->Int{
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {fatalError()}
        cell.backgroundColor = colors[indexPath.item]
        cell.label.text = "\(indexPath)"
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let color = colors.remove(at: sourceIndexPath.item)
        colors.insert(color, at: destinationIndexPath.item)
    }
}
extension ViewController{
    func setUI() {
        flowLayout.itemSize = CGSize(width: view.frame.width / 3.3, height: view.frame.height / 4) //아이템 크기
        flowLayout.minimumInteritemSpacing = 10 // 아이템 간의 가로 거리
        flowLayout.minimumLineSpacing = 20 // 아이템 간의 세로 거리
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        // 컬렉션뷰에서 보이는 테두리 거리
        
        flowLayout.scrollDirection = .horizontal
        
        collectionView.dataSource = self
        collectionView.delegate = self //self!! 잊지말기
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)//CustomView로바꿔줌
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    func addGesture() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        collectionView.addGestureRecognizer(gesture)
    }

    @objc
    func didLongPress(_ sender: UILongPressGestureRecognizer){
        let location = sender.location(in: collectionView)//사용자가 누른 위치를 알수있움
        switch sender.state{
        case .began:
            guard let indexPath = collectionView.indexPathForItem(at: location) else {return}
            collectionView.beginInteractiveMovementForItem(at: indexPath)
            print(indexPath)
            
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .ended:
            collectionView.endInteractiveMovement()
        case .cancelled:
            collectionView.cancelInteractiveMovement()
        default:
            break
        }
        
    }

}

