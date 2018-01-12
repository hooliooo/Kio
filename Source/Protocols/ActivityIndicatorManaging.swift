//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
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
        let view: JAActivityIndicatorView = JAActivityIndicatorView(
            activityIndicatorStyle: UIActivityIndicatorViewStyle.gray
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
//        view.backgroundColor = UIColor(red: 225, green: 225, blue: 225)
        view.rpd.cornerRadius(of: 5.0)

        self.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 60.0),
            view.widthAnchor.constraint(equalToConstant: 60.0)
        ])
        return view
    }

    private func findActivityIndicator() -> JAActivityIndicatorView? {
        return self.view.subviews.reversed()
            .filter({ (view: UIView) -> Bool in view is JAActivityIndicatorView}).first as? JAActivityIndicatorView
    }

    func showActivityIndicator() {
        DispatchQueue.main.async { () -> Void in
            self.createActivityIndicator()
                .startAnimating()

            self.view.isUserInteractionEnabled = false
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async { () -> Void in
            guard let view = self.findActivityIndicator() else {
                return
            }
            view.stopAnimating()
            view.removeFromSuperview()
            self.view.isUserInteractionEnabled = true
        }
    }

}
