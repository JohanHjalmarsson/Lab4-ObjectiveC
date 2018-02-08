//
//  ViewController.m
//  Lab4-JohanHjalmarsson
//
//  Created by Johan Hjalmarsson on 2018-02-08.
//  Copyright © 2018 Johan Hjalmarsson. All rights reserved.
//

#import "ViewController.h"
#import "JHDiagram.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet JHDiagram *diagramView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    NSArray *array = @[@{@"name": @"january",
                             
                             @"value": @100},
                           
                           @{@"name": @"february",
                             
                             @"value": @80},
                           
                           @{@"name": @"mars",
                             
                             @"value": @130},
                       @{@"name": @"april",
                         
                         @"value": @10},
                       
                       @{@"name": @"maj",
                         
                         @"value": @200},
                       ];
    [self.diagramView drawDiagram:array];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
