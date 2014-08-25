//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Kelvin Lee on 6/13/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property(nonatomic) int currentQuestionIndex;
@property(nonatomic, copy) NSArray *questions;
@property(nonatomic, copy) NSArray *answers;

@property(nonatomic, weak)IBOutlet UILabel *questionLabel;
@property(nonatomic, weak)IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)path coder:(NSCoder *)coder
{
    return [[self alloc] init];
}

// bronze challenge

-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // create two arrays filled with que and ans
        // and make pointers point to them
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
        // set the tab bar item's title
        self.tabBarItem.title = @"Quiz";
        
        // create a IUImage from file
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        // put the image on the tab bar item
        self.tabBarItem.image = i;
        
        // return the address of the object
        
        // set restoration identifier and class
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // step to the next question
    self.currentQuestionIndex++;
    
    // am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        // go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // display the string in the question label
    self.questionLabel.text = question;
    
    // reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    // what is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // display it in the answer label
    self.answerLabel.text = answer;
}

@end
