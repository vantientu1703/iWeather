//
//  ViewController.m
//  iWeather
//
//  Created by Văn Tiến Tú on 7/24/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;

@end

@implementation ViewController{
    NSArray* quotes;
    NSArray* locations;
    NSArray* PhotoFiles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes=@[@"Một con ngựa dâu cả tàu bỏ cỏ",@"Đi một ngày đang học một sàng khôn",@"Học,học nữa,học mãi",@"Nhất thì bét"];
    locations=@[@"Hà Nội",@"Vĩnh Phúc",@"Hà Tây",@"Hoà Bình"];
    PhotoFiles=@[@"rain",@"sunny",@"thunder",@"windy"];
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex=arc4random_uniform(quotes.count);
    NSLog(@"Quote %d", quoteIndex);
    _quote.text=quotes[quoteIndex];
    int locationIndex=arc4random_uniform(locations.count);
    _location.text=locations[locationIndex];
    
    int photoIndex=arc4random_uniform(PhotoFiles.count);
    NSLog(@"Pho to %d",photoIndex);
    _weatherIcon.image=[UIImage imageNamed:PhotoFiles[photoIndex]];
    NSString* string=[NSString stringWithFormat:@"%2.1f",[self getTemperature]];
    [_temperature setTitle:string forState:UIControlStateNormal];
    
}
-(float) getTemperature{
    return 14.0+ arc4random_uniform(18)+(float)arc4random()/(float) INT32_MAX;
}

@end
