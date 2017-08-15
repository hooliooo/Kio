//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public protocol ActivityIndicatorManaging: class {

    func showActivityIndicator()

    func hideActivityIndicator()

}

public extension ActivityIndicatorManaging where Self: UIViewController {

    func showActivityIndicator() {
        DispatchQueue.main.async {
            let activityIndicatorView: JAActivityIndicatorView = JAActivityIndicatorView(
                activityIndicatorStyle: UIActivityIndicatorViewStyle.gray
            )
            activityIndicatorView.hidesWhenStopped = true
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(activityIndicatorView)
            NSLayoutConstraint.activate([
                activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                activityIndicatorView.heightAnchor.constraint(equalToConstant: 50.0),
                activityIndicatorView.widthAnchor.constraint(equalToConstant: 50.0)
            ])

            activityIndicatorView.startAnimating()
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            guard
                let activityIndicatorView = self.view.subviews.reversed()
                    .filter({ (view: UIView) -> Bool in view is JAActivityIndicatorView }).first as? UIActivityIndicatorView
            else {
                return
            }
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
        }
    }

}
