//
//  TitleViewController.m
//  GameTemplete
//
//  Created by Andrew Garrahan on 7/14/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController (){
    
     UIImageView * myAnimatedView;
}
@property (weak, nonatomic) IBOutlet UILabel *highScore;

@end

@implementation TitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Set up an Array of images
    NSArray * myImages = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"img1.png"],
                          [UIImage imageNamed:@"img2.png"],
                          [UIImage imageNamed:@"img3.png"],
                          [UIImage imageNamed:@"img4.png"],
                          [UIImage imageNamed:@"img5.png"],
                          [UIImage imageNamed:@"img6.png"],
                          [UIImage imageNamed:@"img7.png"],
                          [UIImage imageNamed:@"img8.png"], nil];
    
    myAnimatedView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 190, 194)];
    myAnimatedView.animationImages = myImages;
    myAnimatedView.animationDuration = 0.35;
    [self.view addSubview:myAnimatedView];
    
    
    [myAnimatedView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
