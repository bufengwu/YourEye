//
//  BTAtricleTableViewController.m
//  YourEye
//
//  Created by DevKK on 2017/9/5.
//  Copyright © 2017年 DevKK. All rights reserved.
//

#import "BTAtricleTableViewController.h"

#import "BTArticleAuthorCell.h"
#import "BTArticleWordCell.h"
#import "BTArticleImage.h"

#define kImageName  @"imageName"
#define kImageH     @"imageH"
#define kImageW     @"imageW"

@interface BTAtricleTableViewController ()

@property (nonatomic, strong) NSArray *article;

@end

@implementation BTAtricleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.article = @[
                     @{
                         
                         },
                     @"八月初，为了躲避哈密盆地那酷热难耐、却又日甚一日的热浪冲击，也是为了完成一次哈密山北地区的地理踏勘，我们驱车离开密市，沿203省道北上，横切天山山脉最东部那段山脊，前往它的北部去完成一次踏勘旅行。出发那天，尽管我们精心赶了个大早，却依然没能逃过烈日的追逐。",
                     @"幸好我们的三辆座驾都备有空调，我们便开启冷风，鬼撵着似的往前赶，试图早点到达山北那片凉爽之地。",
                     @{
                         kImageName : @"h1",
                         },
                     @"幸好我们的三辆座驾都备有空调，我们便开启冷风，鬼撵着似的往前赶，试图早点到达山北那片凉爽之地。",
                     @{
                         kImageName : @"h2",
                         },
                     @"能让我们居高临下地俯瞰山北大地的那处天山庙，位于海拔两千七百米的高度上。它是现代203省道跨越天山山脊的一处高程点，又是历史上自汉、唐以来丝绸之路北新道的要冲部位，属中原王朝治理边关的一处关隘。关于天山庙的原始庙宇，它最早的始建年代已经无从考据。有考据的仅仅是清帝乾隆于1876年下旨修筑的那座关帝庙，并且已经数度毁损和改建。",
                     @{
                         kImageName : @"h3",
                         },
                     @"跨越天山庙后，我们沿着九曲回肠的下山路穿越原始针叶林带，径直进入巴里坤草原，住进了松树塘的一家农家小院里",
                     ];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BTArticleAuthorCell" bundle:nil] forCellReuseIdentifier:@"BTArticleAuthorCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BTArticleWordCell" bundle:nil] forCellReuseIdentifier:@"BTArticleWordCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BTArticleImage" bundle:nil] forCellReuseIdentifier:@"BTArticleImage"];
    
    self.tableView.bounces = NO;
    
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"like"] style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share"] style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[button2, button1];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.article.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = self.article[indexPath.row];
    if (indexPath.row == 0) {   //作者信息row
        BTArticleAuthorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BTArticleAuthorCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    } else {    //文章内容
        if ([model isKindOfClass:[NSString class]]) {
            BTArticleWordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BTArticleWordCell" forIndexPath:indexPath];
            cell.paragraph.text = model;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            return cell;
            
        } else if([model isKindOfClass:[NSDictionary class]]) {
            BTArticleImage * cell = [tableView dequeueReusableCellWithIdentifier:@"BTArticleImage" forIndexPath:indexPath];
            cell.imageParagraph.image = [UIImage imageNamed:model[kImageName]];
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else {
            return nil;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {   //作者信息row
        return 50;
    } else {
        id model = self.article[indexPath.row];
        if ([model isKindOfClass:[NSString class]]) {
            NSString *text = model;
            
            NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
            CGSize size = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
            
            
            return size.height;
            
        } else if([model isKindOfClass:[NSDictionary class]]) {
            UIImage *image = [UIImage imageNamed:model[kImageName]];
            
            
            return 200;
        }
        else {
            return 200;
        }
        return 300;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
