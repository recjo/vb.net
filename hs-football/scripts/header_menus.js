
function loadMenus(level) {

        switch (level) {
            case 0:
                lvl = "";
                break;
            case 1:
                lvl = "../";
                break;
            case 2:
                lvl = "../..";
                break;
            case 3:
                lvl = "../../..";
                break;
            default:
                lvl = "";
        }

//  label   The label of the menu -- defaults to "menuLabel" + index
//  mw      Menu width in pixels
//  mh      Menu item height in pixels
//  fnt     Font family used in the menu -- defaults to "arial,helvetica,verdana,sans-serif"
//  fs      Font size used in the menu -- defaults to 12 point
//  fclr    Font color -- defaults to black
//  fhclr   Font highlight color -- defaults to white
//  bg      Menu item's background color -- defaults to light gray (#cccccc)
//  bgh     Menu's background hilight color -- defaults to blue (#000084)
//
//  function Menu(label, mw, mh, fnt, fs, fclr, fhclr, bg, bgh, halgn, valgn, menuItemPadding, menuItemSpacing, hideTimeout, subMenux, subMenuy, srel, opaque, vertical, indent, aw, ah)

//football
  window.football = new Menu("root",155,20,"Verdana, sans-serif, Arial",9,"#4F5D68","#144C83","#FFFFFF","#EDF5F8","left","middle",3,0,200,-5,7,false,true,true,5,false,false);
  football.addMenuItem("Flag Football","location=lvl + 'football/default.aspx'");
  football.addMenuItem("Jr Mighty Mite","location=lvl + 'football/jrmightymite.aspx'");
  football.addMenuItem("Mighty Mite","location=lvl + 'football/mightymite.aspx'");
  football.addMenuItem("Jr Pee Wee - Red","location=lvl + 'football/jrpeeweered.aspx'");
  football.addMenuItem("Jr Pee Wee - Blue","location=lvl + 'football/jrpeeweeblue.aspx'");
  football.addMenuItem("Pee Wee","location=lvl + 'football/peewee.aspx'");
  football.addMenuItem("Jr Midget","location=lvl + 'football/jrmidget.aspx'");
  football.addMenuItem("Midget","location=lvl + 'football/midget.aspx'");
  football.hideOnMouseOut=true;
  football.bgColor='#DADBD7';
  football.menuLiteBgColor='#FFFFFF';
  football.menuBorderBgColor='#FFFFFF';

//team news
  window.teamnews = new Menu("root",155,20,"Verdana, sans-serif, Arial",9,"#4F5D68","#144C83","#FFFFFF","#EDF5F8","left","middle",3,0,200,-5,7,false,true,true,5,false,false);
  teamnews.addMenuItem("Flag Football News","location=lvl + 'teamnews/default.aspx'");
  teamnews.addMenuItem("Jr Mighty Mite News","location=lvl + 'teamnews/jrmightymite.aspx'");
  teamnews.addMenuItem("Mighty Mite News","location=lvl + 'teamnews/mightymite.aspx'");
  teamnews.addMenuItem("Jr Pee Wee - Red News","location=lvl + 'teamnews/jrpeeweered.aspx'");
  teamnews.addMenuItem("Jr Pee Wee - Blue News","location=lvl + 'teamnews/jrpeeweeblue.aspx'");
  teamnews.addMenuItem("Pee Wee News","location=lvl + 'teamnews/peewee.aspx'");
  teamnews.addMenuItem("Jr Midget News","location=lvl + 'teamnews/jrmidget.aspx'");
  teamnews.addMenuItem("Midget News","location=lvl + 'teamnews/midget.aspx'");
  teamnews.hideOnMouseOut=true;
  teamnews.bgColor='#DADBD7';
  teamnews.menuLiteBgColor='#FFFFFF';
  teamnews.menuBorderBgColor='#FFFFFF';

//cheer
  window.cheer = new Menu("root",155,20,"Verdana, sans-serif, Arial",9,"#4F5D68","#144C83","#FFFFFF","#EDF5F8","left","middle",3,0,200,-5,7,false,true,true,5,false,false);
  cheer.addMenuItem("Teams","location=lvl + 'cheer/'");
  cheer.addMenuItem("Rosters","location=lvl + 'cheer/'");
  cheer.addMenuItem("Schedules","location=lvl + 'cheer/'");
  cheer.hideOnMouseOut=true;
  cheer.bgColor='#DADBD7';
  cheer.menuLiteBgColor='#FFFFFF';
  cheer.menuBorderBgColor='#FFFFFF';

//shop
  window.shop = new Menu("root",155,20,"Verdana, sans-serif, Arial",9,"#4F5D68","#144C83","#FFFFFF","#EDF5F8","left","middle",3,0,200,-5,7,false,true,true,5,false,false);
  shop.addMenuItem("Coming Soon","location=lvl + ''");
  shop.hideOnMouseOut=true;
  shop.bgColor='#DADBD7';
  shop.menuLiteBgColor='#FFFFFF';
  shop.menuBorderBgColor='#FFFFFF';

writeMenus();
}
