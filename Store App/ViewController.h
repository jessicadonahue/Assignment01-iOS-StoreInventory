//
//  ViewController.h
//  Store App
//
//  Created by Jessica Donahue on 2/28/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
{
    
    NSMutableArray * productArray;
}

+ (ViewController *) sharedInstance;

@property (strong, nonatomic, readwrite) NSMutableArray *productArray;

@end

