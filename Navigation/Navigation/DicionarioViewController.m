//
//  DicionarioViewController.m
//  Navigation
//
//  Created by Victor Lisboa on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioViewController.h"
#import "ClasseDicionario.h"

@interface DicionarioViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation DicionarioViewController



@synthesize imgView, label, start;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    
    // Alterando o título da navigation bar
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%@", [dic.letras objectAtIndex:dic.cont]]];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 95, 200, 200)];
    [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[dic.imagens objectAtIndex:dic.cont]]]];
    [self.view addSubview:imgView];
    imgView.alpha = 0.0;
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.imgView.layer.cornerRadius = self.imgView.frame.size.width / 2;
    self.imgView.clipsToBounds = YES;
    imgView.backgroundColor=[UIColor whiteColor];
    
    // Configurando a palavra da Letra corrente
    label = [[UITextField alloc]initWithFrame:CGRectMake(130, 295, 100, 30)];
    label.text = [NSString stringWithFormat:@"%@", dic.palavras];
    label.enabled = NO;
    [label setText:[NSString stringWithFormat:@"%@",[dic.palavras objectAtIndex:dic.cont]]];
    [self.view addSubview:label];
    label.alpha = 0.0;
    label.textColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    
    // Configuração dos botões da navigaton controller
    UIToolbar *tool = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 63, 325, 30)];
    [self.view addSubview:tool];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(botaoEditar:)];
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"Concluir" style:UIBarButtonItemStylePlain target:self action:@selector(botaoDone:)];
    UIBarButtonItem *camera = [[UIBarButtonItem alloc]initWithTitle:@"Camera" style:UIBarButtonItemStylePlain target:self action:@selector(tirarFoto:)];
    NSArray *editar = [[NSArray alloc]initWithObjects: button, done, camera, nil];
    [tool setItems:editar];
    
    self.tabBarController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"ABC" image:[UIImage imageNamed:@"ABC"] tag:1];
    
    UILongPressGestureRecognizer *zoom = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(zoomImg:)];
    zoom.minimumPressDuration=0.5;
    [imgView addGestureRecognizer:zoom];
    imgView.userInteractionEnabled = YES;
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imgView.alpha = 1.0;
        label.alpha = 1.0;
    }completion:nil];
    
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imgView.transform = CGAffineTransformMakeRotation(M_PI);
    }completion:^(BOOL finished){
        [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            imgView.transform = CGAffineTransformMakeRotation(2*M_PI);
        }completion:nil];
    }];
}
-(void)next:(id)sender {
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    dic.cont++;
    DicionarioViewController *proximo = [[DicionarioViewController alloc]initWithNibName:nil bundle:NULL];
    imgView.alpha = 0.0;
    label.alpha = 0.0;
    
    [self.navigationController pushViewController:proximo animated:NO];
}
-(void)back:(id)sender{
    ClasseDicionario *dic = [ClasseDicionario sharedInstance];
    dic.cont--;
    imgView.alpha = 0.0;
    label.alpha = 0.0;
    //    DicionarioViewController *anterior = [[DicionarioViewController alloc]initWithNibName:nil bundle:NULL];
    [self.navigationController popViewControllerAnimated:NO];
}
-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle{
    self = [super initWithNibName:nil bundle:nil];
    if(self){
        UITabBarItem *tb = [self tabBarItem];
        [tb setTitle:@"ABC"];
        UIImage *i = [UIImage imageNamed:@"ABC.png"];
        [tb setImage:i];
    }
    return self;
}
-(void)botaoEditar: (id)sender{
    label.enabled = YES;
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor whiteColor];
}
-(void)botaoDone: (id)sender{
    
    label.enabled = NO;
    label.backgroundColor = [UIColor darkGrayColor];
    self.label.backgroundColor = [UIColor clearColor];
    self.parentViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
}
-(void)zoomImg:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        imgView.transform = CGAffineTransformIdentity;
        imgView.frame = CGRectMake(60, 100, 200, 200);
        [UIView animateWithDuration:0.3 animations:^{
            imgView.transform = CGAffineTransformMakeScale(2, 2);
        }];
    }
    if (sender.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.3 animations:^{
            [self.view.layer removeAllAnimations];
            [UIView animateWithDuration:1.0 animations:^{
                imgView.transform = CGAffineTransformIdentity;
        }];
    }];

}
}
-(void)tirarFoto: (id)sender{
    UIImagePickerController *camera = [[UIImagePickerController alloc]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        camera.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        camera.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    camera.delegate = self;
    [self presentViewController:camera animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *imagem = info[UIImagePickerControllerOriginalImage];
    self.imgView.image = imagem;
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)pinch:(UIPinchGestureRecognizer *)sender{
    CGAffineTransform transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
    imgView.transform = transform;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    start = [touch locationInView:self.view];
    imgView.center = CGPointMake(start.x, start.y);
}

@end

