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

    private func createActivityIndicator() -> JAActivityIndicatorView {
        let activityIndicatorView: JAActivityIndicatorView = JAActivityIndicatorView(
            activityIndicatorStyle: UIActivityIndicatorViewStyle.gray
        )
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.backgroundColor = UIColor(red: 225, green: 225, blue: 225)
        activityIndicatorView.rpd.cornerRadius(of: 5.0)

        self.view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 50.0),
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 50.0)
        ])
        return activityIndicatorView
    }

    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.createActivityIndicator()
                .startAnimating()
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
