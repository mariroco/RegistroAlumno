//
//  MapViewController.m
//  Parcial_II
//
//  Created by ISSC411_2021 on 18/05/21.
//

#import "MapViewController.h"

@interface MapViewController ()


@end

@implementation MapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"http://bajio.delasalle.edu.mx/";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [_webview loadRequest:request];
}

@end

