//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport



class MyViewController : UIViewController {
    let segmentedControl = UISegmentedControl()
    let buttonBar = UIView()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        segmentedControl.insertSegment(withTitle: "One", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Two", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        // 我们需要使用自动布局约束
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        self.view = view
        
        //约束到容器view的顶部
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        // 限制为容器view的宽度
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        // 设置高度
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedStringKey.font: UIFont(name: "Helvetica Neue", size: 18)!,
            NSAttributedStringKey.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont(name: "Helvetica Neue", size: 18)!,
            NSAttributedStringKey.foregroundColor: UIColor.orange
            ], for: .selected)
        
        
        // 由于我们要使用自动布局，需要设置为false
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor.orange
        
        view.addSubview(buttonBar)
        buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)).isActive = true
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
