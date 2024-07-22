//
//  ViewController.swift
//  WeatherApp
//
//  Created by Artem Martirosyan on 21.07.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private lazy var weatherPickerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 100, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(WeatherPickerCell.self, forCellWithReuseIdentifier: "weatherCell")
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configuteUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pickRandomWeather()
    }
    
    func pickRandomWeather() {
        let randomIndex = Int.random(in: 0..<WeatherType.allCases.count)
        let indexPath = IndexPath(item: randomIndex, section: 0)
        weatherPickerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        weatherPickerCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        collectionView(weatherPickerCollectionView, didSelectItemAt: indexPath)
    }
    
    func configuteUI() {
        view.addSubview(weatherImageView)
        view.addSubview(weatherPickerCollectionView)
        
        NSLayoutConstraint.activate([
            weatherPickerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            weatherPickerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherPickerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherPickerCollectionView.heightAnchor.constraint(equalToConstant: (view.bounds.height / 10)),
            
            weatherImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            weatherImageView.widthAnchor.constraint(equalToConstant: 200),
            weatherImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherPickerCell
        cell.configure(with: WeatherType.allCases[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage(systemName: WeatherType.allCases[indexPath.item].symbol) ?? UIImage()
        
        UIView.transition(with: weatherImageView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.weatherImageView.image = image
        })
    }
}
