//
//  DicionarioViewController.m
//  Navigation
//
//  Created by Victor Lisboa on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioViewController.h"

@interface DicionarioViewController ()

@end

@implementation DicionarioViewController

@synthesize imgView, label, angle, scaleFactor;


- (void)viewDidLoad {
    [super viewDidLoad];
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    self.title = [NSString stringWithFormat:@"%@", [dic.letras objectAtIndex:dic.cont]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
        self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[dic.imagens objectAtIndex:dic.cont]]]];
    [self.view addSubview:imgView];
    label = [[UILabel alloc]initWithFrame:CGRectMake(130, 400, 200, 200)];
    [label setText:[NSString stringWithFormat:@"%@",[dic.palavras objectAtIndex:dic.cont]]];
    [self.view addSubview:label];
    imgView.alpha = 0.0;
    label.alpha = 0.0;
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.imgView.layer.cornerRadius = self.imgView.frame.size.width / 2;
    self.imgView.clipsToBounds = YES;
    label.textColor = [UIColor whiteColor];
    scaleFactor = 2;
    angle = 180;
    [self.view addSubview:imgView];
//        UIButton *botao = [UIButton
//                           buttonWithType:UIButtonTypeSystem];
//        [botao
//         setTitle:@"Mostre uma palavra, uma figura e leia a palavra ao apertar um botao"
//         forState:UIControlStateNormal];
//        [botao sizeToFit];
//        botao.center = self.view.center;
//    
//        [self.view addSubview:botao];
    
}
-(void)viewDidAppear:(BOOL)animated{
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imgView.alpha = 1.0;
        label.alpha = 1.0;
    }completion:^(BOOL finished){
}];

//    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
//        imgView.alpha = 1.0;
//    }completion:^(BOOL finished){
//        [UIView animateWithDuration:3.0 animations:^{
//            imgView.alpha = 0.0;
//        }];
//    }];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGAffineTransform scaleTrans =
                         CGAffineTransformMakeScale(scaleFactor, scaleFactor);
                         CGAffineTransform rotateTrans =
                         CGAffineTransformMakeRotation(angle * M_PI / 180);
                         imgView.transform = CGAffineTransformConcat(scaleTrans,rotateTrans);
                         angle = (angle == 180 ? 360 : 180);
                         scaleFactor = (scaleFactor == 2 ? 1 : 2);

                     } completion:nil];
    
}
-(void)next:(id)sender {
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    dic.cont++;
    DicionarioViewController *proximo = [[DicionarioViewController alloc]initWithNibName:nil bundle:NULL];
         imgView.alpha = 0.0;
    label.alpha = 0.0;
    
        [self.navigationController pushViewController:proximo
                                             animated:YES];
}
-(void)back:(id)sender{
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    dic.cont--;
    imgView.alpha = 0.0;
    label.alpha = 0.0;
//    DicionarioViewController *anterior = [[DicionarioViewController alloc]initWithNibName:nil bundle:NULL];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

