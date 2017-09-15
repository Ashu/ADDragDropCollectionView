//
//  ViewController.swift
//  ADDragDropCollectionView
//
//  Created by Ashutosh Dave on 08/09/17.
//  Copyright © 2017 Ashutosh Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!

	var longPressGesture: UILongPressGestureRecognizer?
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		longPressGesture = UILongPressGestureRecognizer.init(target: self, action: #selector(ViewController.handleLongGesture(_:)))
		self.collectionView.addGestureRecognizer(longPressGesture!)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func handleLongGesture(_ gesture: UILongPressGestureRecognizer) {
		switch gesture.state {
		case .began:
			guard let selectedIndexPath = self.collectionView.indexPathForItem(at: gesture.location(in: self.collectionView)) else {
				break
			}
			collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
			break
			
		case .changed:
			collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: self.collectionView))
			break
			
		case .ended:
			collectionView.endInteractiveMovement()
			break
			
		default:
			collectionView.cancelInteractiveMovement()
		}
	}


}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 50
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		
	}
}
