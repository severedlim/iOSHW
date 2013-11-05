//
//  ELHW3ViewController.m
//  ELHW3
//
//  Created by Ed Lim on 11/4/13.
//  Copyright (c) 2013 NYU. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1

//#define kLatestKivaLoansURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"] //2

#define kYouTubeMostPop [NSURL URLWithString:@"http://gdata.youtube.com/feeds/api/standardfeeds/most_popular?v=2&alt=json"]


#import "ELHW3ViewController.h"
#import "Utility.h"

@interface ELHW3ViewController (){
    
    
}


@end

@implementation ELHW3ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_async(kBgQueue, ^{
        
        NSData * data = [NSData dataWithContentsOfURL:kYouTubeMostPop];
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
    NSMutableArray *videoArray;
    videoArray = [NSMutableArray arrayWithObjects: @"1.jpg", @"2.jpg", @"3.jpg", @"1.jpg", nil];

    
    UIScrollView *scroll = [[UIScrollView alloc]
                            initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.backgroundColor = [UIColor blueColor];
    scroll.indicatorStyle = UIScrollViewIndicatorStyleBlack;
	
    // Snaps to a page
    scroll.pagingEnabled = YES;
	
    
    int size = self.view.frame.size.width;
    int rows = 8;
    
    /*
    (NSData *)responseData{
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    NSDictionary * feed = [json objectForKey:@"feed"];
    NSArray * entry = [feed objectForKey:@"entry"];
    
    }
    
    */
    
    for (int i = 0; i < rows ;i++) {
        
        UIView * box = [[UIView alloc]initWithFrame:CGRectMake( i * size, 0 , size, size)];
        box.backgroundColor = [Utility randomColor];
        [scroll addSubview:box];
        
        //NSString * imageName = [videoArray objectAtIndex:i];
        
        //UIImage * awesomeImage = [UIImage imageNamed:imageName];
        
        //UIImageView * awesomeImageView = [[UIImageView alloc]initWithImage:awesomeImage ];
        //awesomeImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        //awesomeImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        //[box addSubview:awesomeImageView];

       
        
    }
    
        
        
    // Set size of scroll plane / content size
    scroll.contentSize = CGSizeMake(size * rows, 200);
    [self.view addSubview:scroll];
    
    
    
}
                        
- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                                                  
                          options:kNilOptions
                          error:&error];
                            
                            NSDictionary * feed = [json objectForKey:@"feed"];
                            
                            // Print each item in NSDictionary feed
                            for (NSString *s in feed) {
                                NSLog(@"feed: %@", s );
                            }
                            
                            NSLog(@"\n" );  // Extra space
                            
                            NSArray * entry = [feed objectForKey:@"entry"];
                            
                            /* for (NSString *s in entry) {
                             NSLog(@"entry: %@", s );
                             }*/
                            
                            
                            ////////////////////////////////////////
                            // Get first youtube object
                            ////////////////////////////////////////
                            NSDictionary * node = [entry objectAtIndex:0];
                            
                            for (NSString *s in node) {
                                NSLog(@"node: %@", s );
                            }
                            
                            NSDictionary * title = [node objectForKey:@"title"];
                            
                            NSLog(@"\n" );
                            NSLog(@"title: %@", [title objectForKey:@"$t"] );
                            
                            NSDictionary * media = [node objectForKey:@"media$group"];
                            NSArray * thumbArray = [media objectForKey:@"media$thumbnail"];
                            
                            NSDictionary * thumb = [thumbArray objectAtIndex:0];
                            
                            NSLog(@"\n" );
                            NSLog(@"thumURL: %@", [thumb objectForKey:@"url"] );
                            
                            
                            ////////////////////////////////////////
                            // Loop app entry nodes
                            ////////////////////////////////////////
                            
                            for (NSDictionary *e in entry) {
                                
                                NSDictionary * title = [e objectForKey:@"title"];
                                
                                NSLog(@"\n" );
                                NSLog(@"title: %@", [title objectForKey:@"$t"] );
                                
                                NSDictionary * media = [e objectForKey:@"media$group"];
                                NSArray * thumbArray = [media objectForKey:@"media$thumbnail"];
                                
                                NSDictionary * thumb = [thumbArray objectAtIndex:0];
                                NSLog(@"thumURL: %@", [thumb objectForKey:@"url"] );
                            }
                        }
                        
                        



                   
@end