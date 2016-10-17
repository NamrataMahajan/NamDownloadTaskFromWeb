//
//  ViewController.h
//  NamDownloadFromWeb
//
//  Created by Namrata on 16/10/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#define kImageURLString @"https://ae01.alicdn.com/kf/HTB184GVLVXXXXbPXpXXq6xXFXXXg/-font-b-Cinderella-b-font-Elegant-Red-Sequin-Bodice-Flower-Girl-font-b-Dresses-b.jpg"

#define kImageURLString1 @"https://i.ytimg.com/vi/_SOL5wG7t1g/maxresdefault.jpg"

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *ImageView1;

@property (strong, nonatomic) IBOutlet UIImageView *Imageview2;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ImageView1ActivityInadicator;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ImageView2ActivityIndicator;




- (IBAction)Actionstart:(id)sender;


@end

