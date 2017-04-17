//
//  AddViewController.m
//  Store App
//
//  Created by Jessica Donahue on 3/1/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "AddViewController.h"
#import "Object_Info.h"
#import "ViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addProductName;
@property (weak, nonatomic) IBOutlet UITextField *addProductDescription;
@property (weak, nonatomic) IBOutlet UITextField *addProductCost;
@property (weak, nonatomic) IBOutlet UITextField *addNumOnHand;

@property (weak, nonatomic) IBOutlet UIButton *enter;


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    Object_Info *newProduct = [[Object_Info alloc] init];
    [newProduct setName: [self.addProductName text]];
    [newProduct setDescription: [self.addProductDescription text] ];
    [newProduct setCost: [self.addProductCost.text floatValue]];
    [newProduct setNum_on_Hand: [self.addNumOnHand.text floatValue]];
    [newProduct setProduct_Image:@"noImage.jpg"];
    
    ViewController *viewC = [ViewController sharedInstance];
    
    [viewC.productArray addObject: newProduct];
    


}


- (IBAction)enterPressed:(id)sender {
    
}

@end
