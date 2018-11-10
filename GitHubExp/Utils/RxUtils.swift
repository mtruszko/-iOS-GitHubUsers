//
//  RxUtils.swift
//  GitHubExp
//
//  Created by marek on 07/11/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import RxSwift

public var mainScheduler: SchedulerType = MainScheduler.instance
public var workScheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .default)

