//
//  ViewController.h
//  Piraa
//
//  Created by Helia Taghavi on 7/28/15.
//  Copyright (c) 2015 Gereh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property NSMutableArray* nearBS;
@property NSMutableArray* favBS;
@property NSMutableArray* sugBS;
@property NSMutableArray* nearBSArea;
@property NSMutableArray* favBSArea;
@property NSMutableArray* sugBSArea;
@property NSMutableArray* nearBSInitials;
@property NSMutableArray* favBSInitials;
@property NSMutableArray* sugBSInitials;

@end

