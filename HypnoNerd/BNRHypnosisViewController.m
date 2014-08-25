//
//  BNRHypnosisViewController.m
//  BNR-iOS-HypnoNerd
//
//  Created by Kelvin Lee on 6/16/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)path coder:(NSCoder *)coder
{
    return [[self alloc] init];
}

// override UIViewController's designated initializer, to get and set tab bar item
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // create a UIImage from file
        // this will use hypno@2x.png on retina
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        // put the image on the tab bar item
        self.tabBarItem.image = i;
        
        // set restoration class and identifier
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
    }
    return self;
}

- (void)loadView
{
    // create a view
    // frame bounds for positioning segment controls
    CGRect frame = [[UIScreen mainScreen] bounds];
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // center point for positioning segment controls
    CGPoint centerPoint;
    centerPoint.x = frame.size.width / 2;
    centerPoint.y = frame.size.height / 5 * 4;
    
    // create segment control
    NSArray *segmentChoices = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentChoices];
    segmentedControl.frame = CGRectMake(centerPoint.x, centerPoint.y, 150, 35);
    segmentedControl.selectedSegmentIndex = 1;
    
    // center the segment control using centerPoint
    [segmentedControl setCenter:centerPoint];
    
    // add BNRHypnosisView backgroundView to be this controller's view
    // then add segmentedControl as the subview of backgroundView
    self.view = backgroundView;
    [backgroundView addSubview:segmentedControl];
    
    // the selector is declared in BNRHypnosisView
    // the color change happens in BNRHypnosisView
    // when segment is selected, the color changes
    [segmentedControl addTarget:backgroundView
                         action:@selector(changeCircleColorFromSegment:)
               forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidLoad
{
    // always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController loaded its view");
}


@end
