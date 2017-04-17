//
//  ViewController.m
//  Store App
//
//  Created by Jessica Donahue on 2/28/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "Object_Info.h"
#import "addViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UITextField *productDescription;
@property (weak, nonatomic) IBOutlet UITextField *productCost;

@property (weak, nonatomic) IBOutlet UILabel *numOnHand;

@property (strong, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UIButton *increment;
@property (weak, nonatomic) IBOutlet UIButton *decrement;

@property (weak, nonatomic) IBOutlet UIButton *addRecord;

@property (weak, nonatomic) IBOutlet UIButton *backward;
@property (weak, nonatomic) IBOutlet UIButton *forward;




@end

//static NSMutableArray *productArray;
static int arrayIndex = 0;


@implementation ViewController

@synthesize productArray = _productArray;


+ (ViewController *) sharedInstance {
    static dispatch_once_t onceToken;
    static ViewController * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[ViewController alloc] init ];
    });
    return instance;
}

- (id) init {
    self = [super init] ;
    if (self) {
        _productArray = [[NSMutableArray alloc] init];
    }
    return self;
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ViewController *viewC = [ViewController sharedInstance];
    
    
    /*
     Creating the items and adding them to the array
     */
    
    if([viewC.productArray count] == 0){
        Object_Info *product1 = [[Object_Info alloc] init];
        [product1 setName: @"iPhone 7"];
        [product1 setDescription:@"Apple's iPhone 6 minus plug"];
        [product1 setCost:769.00];
        [product1 setNum_on_Hand:2];
        [product1 setProduct_Image:@"iphone7.jpg"];
        
        Object_Info *product2 = [[Object_Info alloc] init];
        [product2 setName: @"Galaxy Note7"];
        [product2 setDescription:@"Samsung's Exploding Phone"];
        [product2 setCost:850.00];
        [product2 setNum_on_Hand:90];
        [product2 setProduct_Image:@"galaxy.jpg"];
        
        
        Object_Info *product3 = [[Object_Info alloc] init];
        [product3 setName: @"40-inch TV"];
        [product3 setDescription:@"Sony's LED TV"];
        [product3 setCost:298.00];
        [product3 setNum_on_Hand:89];
        [product3 setProduct_Image:@"tv40.jpg"];
        
        Object_Info *product4 = [[Object_Info alloc] init];
        [product4 setName: @"Kindle Reader"];
        [product4 setDescription:@"Amazon's E-Reader"];
        [product4 setCost:79.99];
        [product4 setNum_on_Hand:200];
        [product4 setProduct_Image:@"kindle.jpg"];
        
        Object_Info *product5 = [[Object_Info alloc] init];
        [product5 setName: @"Apple Watch"];
        [product5 setDescription:@"Series 2 - Aluminum Case"];
        [product5 setCost:299.00];
        [product5 setNum_on_Hand:0];
        [product5 setProduct_Image:@"apple_watch.jpg"];
        
        //Insert products into the product array
        [viewC.productArray addObject:product1];
        [viewC.productArray addObject:product2];
        [viewC.productArray addObject:product3];
        [viewC.productArray addObject:product4];
        [viewC.productArray addObject:product5];
    }
    
    
    // Update the information being displayed
    self.productName.text = [[viewC.productArray objectAtIndex: arrayIndex] Name];
    self.productDescription.text = [[viewC.productArray objectAtIndex: arrayIndex] Description];
    
    NSString *costTemp = [[NSString alloc] initWithFormat:@"%.2f", [[viewC.productArray objectAtIndex: arrayIndex]Cost]];
    self.productCost.text = costTemp;
    
    NSString *numOnHandTemp = [[NSString alloc] initWithFormat:@"%d", [[viewC.productArray objectAtIndex: arrayIndex]Num_on_Hand]];
    self.numOnHand.text = numOnHandTemp;
    
    
    _productImage= [[UIImageView alloc] initWithImage:[UIImage imageNamed: [[viewC.productArray objectAtIndex: arrayIndex] Product_Image]]];
    _productImage.frame = CGRectMake(105, 100, 160, 120);
    [self.view addSubview:_productImage]; 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backwardPressed:(id)sender {
    ViewController *viewC = [ViewController sharedInstance];
    
    
    
    // if the new index is not less than zero -> decrement the index
    if((arrayIndex - 1) >= 0){
        arrayIndex--;
        
        [_backward setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        // Update the information being displayed
        self.productName.text = [[viewC.productArray objectAtIndex: arrayIndex] Name];
        self.productDescription.text = [[viewC.productArray objectAtIndex: arrayIndex] Description];
        
        NSString *costTemp = [[NSString alloc] initWithFormat:@"%.2f", [[viewC.productArray objectAtIndex: arrayIndex]Cost]];
        self.productCost.text = costTemp;
        
        NSString *numOnHandTemp = [[NSString alloc] initWithFormat:@"%d", [[viewC.productArray objectAtIndex: arrayIndex]Num_on_Hand]];
        self.numOnHand.text = numOnHandTemp;
        
        _productImage= [[UIImageView alloc] initWithImage:[UIImage imageNamed: [[viewC.productArray objectAtIndex: arrayIndex] Product_Image]]];
        _productImage.frame = CGRectMake(105, 100, 160, 120);
        [self.view addSubview:_productImage];
    }
    //else CHANGE COLOR OF BUTTON
    else{
        
        [_backward setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
    }
    
    if ((arrayIndex + 1) < [viewC.productArray count]) {
        
        
        [_forward setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }


    
}

- (IBAction)forwardPressed:(id)sender {
    ViewController *viewC = [ViewController sharedInstance];
    
    //if the index is less than the length of the array -> increment the index
    
    if ((arrayIndex + 1) < [viewC.productArray count]) {
        arrayIndex++;
        
        [_forward setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        // Update the information being displayed
        self.productName.text = [[viewC.productArray objectAtIndex: arrayIndex] Name];
        self.productDescription.text = [[viewC.productArray objectAtIndex: arrayIndex] Description];
        
        NSString *costTemp = [[NSString alloc] initWithFormat:@"%.2f", [[viewC.productArray objectAtIndex: arrayIndex]Cost]];
        self.productCost.text = costTemp;
        
        NSString *numOnHandTemp = [[NSString alloc] initWithFormat:@"%d", [[viewC.productArray objectAtIndex: arrayIndex]Num_on_Hand]];
        self.numOnHand.text = numOnHandTemp;
        
        _productImage= [[UIImageView alloc] initWithImage:[UIImage imageNamed: [[viewC.productArray objectAtIndex: arrayIndex] Product_Image]]];
        _productImage.frame = CGRectMake(105, 100, 160, 120);
        [self.view addSubview:_productImage];
    }
    //else set the index back to the beginning of the array
    else {

        [_forward setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    

    if((arrayIndex - 1) >= 0){
        
        [_backward setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }

    
}

- (IBAction)incrementPressed:(id)sender {
    ViewController *viewC = [ViewController sharedInstance];
    int productNum = [[viewC.productArray objectAtIndex:arrayIndex] Num_on_Hand];
    productNum++;
    
    [[viewC.productArray objectAtIndex: arrayIndex] setNum_on_Hand: productNum];
    
    NSString *numString = [[NSString alloc] initWithFormat:@"%d", productNum];
    self.numOnHand.text = numString;
    
    
}


- (IBAction)decrementPressed:(id)sender {
    ViewController *viewC = [ViewController sharedInstance];
    int productNum = [[viewC.productArray objectAtIndex:arrayIndex] Num_on_Hand];
    productNum--;
    
    if (productNum < 0) {
        productNum = 0;
    }
    
    [[viewC.productArray objectAtIndex: arrayIndex] setNum_on_Hand: productNum];
    
    NSString *numString = [[NSString alloc] initWithFormat:@"%d", productNum];
    self.numOnHand.text = numString;

    
}




@end












