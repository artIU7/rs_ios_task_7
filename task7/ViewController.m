//
//  ViewController.m
//  task7
//
//  Created by Артем Стратиенко on 05.07.2021.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *RSSchoolLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // call :: addRSSchoolLabel
    [ self addRSSchoolLabel ];
}
- ( void ) addRSSchoolLabel  {
    CGRect labelFrame = CGRectMake(self.view.center.x/2,
                                   self.view.frame.size.height - (self.view.frame.size.height - 80),
                                   160,
                                   36.0f);
    self.RSSchoolLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.RSSchoolLabel.text = @"RSSchool";
    self.RSSchoolLabel.numberOfLines = 1;
    self.RSSchoolLabel.font = [UIFont boldSystemFontOfSize:36.0f];
    // add SF pro
    self.RSSchoolLabel.center = CGPointMake(self.view.center.x, self.view.frame.size.height - (self.view.frame.size.height - 80));
    self.RSSchoolLabel.textColor = UIColor.blackColor;
    [self.view addSubview:self.RSSchoolLabel];
}
@end
