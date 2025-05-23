//
//  ViewController.swift
//  StartingCamp
//
//  Created by yimkeul on 3/5/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var coreDataManager: CoreDataManager!
    var items: [Memo] = []

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = cardSize
        layout.minimumInteritemSpacing = Sizes.padding.value
        layout.minimumLineSpacing = Sizes.padding.value

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBackgroundImage()
        setupCollectionView()
        let context = (UIApplication.shared.delegate as! AppDelegate).managedContext
        coreDataManager = CoreDataManager(context: context)
        fetchMemos()
    }
    
    private func fetchMemos() {
        coreDataManager.fetchAllMemos { [weak self] memos in
            self?.items = memos
            self?.collectionView.reloadData()
        }
    }



    private func setupCollectionView() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Sizes.padding.value),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Sizes.padding.value),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

    private func addNewItem(title: String, description: String, imageName: String) {
        coreDataManager.addNewMemo(title: title, description: description, imageName: imageName)
        fetchMemos()
    }


    // 배경이미지
    private func setupViewBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = Images.bgImg.image
        backgroundImage.contentMode = .scaleToFill
        view.insertSubview(backgroundImage, at: 0)
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell

        
        if indexPath.item < items.count {
            let memo = items[indexPath.item]
            cell.configure(with: memo)
        } else {
            cell.configureAsEmptyCard()
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.item == items.count {
            presentAddItemModal()
        } else {
            let selectedMemo = items[indexPath.item]

            let itemDetailVC = ItemDetailViewController()
            itemDetailVC.item = selectedMemo
            let navigationController = UINavigationController(rootViewController: itemDetailVC)
            present(navigationController, animated: true, completion: nil)
        }
    }

    private func presentAddItemModal() {
        let addItemVC = AddItemViewController()
        addItemVC.inputHandler = { [weak self] title, description, imageName in
            self?.addNewItem(title: title, description: description, imageName: imageName)
        }
        let navigationController = UINavigationController(rootViewController: addItemVC)
        present(navigationController, animated: true)
    }

}

