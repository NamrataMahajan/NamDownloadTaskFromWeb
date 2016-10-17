//
//  ViewController.m
//  NamDownloadFromWeb
//
//  Created by Namrata on 16/10/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUp {
    self.ImageView1ActivityInadicator.hidesWhenStopped = YES;
    self.ImageView2ActivityIndicator.hidesWhenStopped = YES;
}

-(void)downloadImageFromURLString:(NSString *)urlString {
    
    [self.ImageView1ActivityInadicator startAnimating];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration *myConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:myConfiguration];
    
    NSURLSessionDownloadTask *myDowloadTask = [mySession downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //
        }
        else {
            if (response) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                if (httpResponse.statusCode == 200) {
                    NSData *imageData = [NSData dataWithContentsOfURL:location];
                    UIImage *myImage = [UIImage imageWithData:imageData];
                    
                    [self performSelectorOnMainThread:@selector(reloadImage:) withObject:myImage waitUntilDone:NO];
                }
                else {
                    [self.ImageView1ActivityInadicator stopAnimating];
                    
                }
            }
                else {
                    [self.ImageView1ActivityInadicator stopAnimating];
            }
        }
    }];
    [myDowloadTask resume];
    
}

-(void)downloadImageFromURLString1:(NSString *)urlString {
    
    [self.ImageView2ActivityIndicator startAnimating];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration *myConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:myConfiguration];
    
    NSURLSessionDownloadTask *myDowloadTask = [mySession downloadTaskWithURL:URL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //
        }
        else {
            if (response) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                if (httpResponse.statusCode == 200) {
                    NSData *imageData = [NSData dataWithContentsOfURL:location];
                    UIImage *myImage = [UIImage imageWithData:imageData];
                    
                    [self performSelectorOnMainThread:@selector(reloadImage1:) withObject:myImage waitUntilDone:NO];
                }
                else {
                    [self.ImageView2ActivityIndicator stopAnimating];
                    
                }
            }
            else {
                [self.ImageView2ActivityIndicator stopAnimating];
            }
        }
    }];
    [myDowloadTask resume];
    
}
-(void)reloadImage:(UIImage *)myImage {
    [self.ImageView1ActivityInadicator stopAnimating];
    self.ImageView1.image = myImage;
}
-(void)reloadImage1:(UIImage *)myimage{
    [self.ImageView2ActivityIndicator stopAnimating];
    self.Imageview2.image = myimage;
}




- (IBAction)Actionstart:(id)sender {
    [self downloadImageFromURLString:kImageURLString];
    [self downloadImageFromURLString1:kImageURLString1];
}
@end
