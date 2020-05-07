//
//  HealthRequestViewController.swift
//  Hadge
//
//  Created by Thomas Dohmke on 5/6/20.
//  Copyright © 2020 Entire. All rights reserved.
//

import UIKit
import HealthKit

class HealthRequestViewController: UIViewController {
    @IBOutlet weak var healthButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        healthButton.layer.cornerRadius = 4

        for subView in self.view.subviews where subView is UITextView {
            guard let textView = subView as? UITextView else { continue }
            textView.textContainerInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    @IBAction func requestHealthAccess(_ sender: Any) {
        let objectTypes: Set<HKObjectType> = [
            HKObjectType.activitySummaryType(),
            HKObjectType.workoutType(),
            HKQuantityType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!
        ]

        #if targetEnvironment(simulator)
        let samplesTypes: Set<HKSampleType> = [
            HKObjectType.workoutType()
        ]
        #else
        let samplesTypes: Set<HKSampleType> = []
        #endif

        Health.shared().healthStore?.getRequestStatusForAuthorization(toShare: samplesTypes, read: objectTypes) { (status, _) in
            if status == .shouldRequest {
                Health.shared().healthStore?.requestAuthorization(toShare: samplesTypes, read: objectTypes) { (_, _) in
                    NotificationCenter.default.post(name: .didReceiveHealthAccess, object: nil)
                }
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.open(URL(string: "x-apple-health://")!)
                }
            }
        }
    }
}
