
class BaseUrl{

 // https://yookatale-server.onrender.com/api/products
 // https://yookatale-server.onrender.com/api/products



  static String address="yookatale-server.onrender.com";// web url

  static String categoryImageUrl="https://eazyrent256.com/api/owner/mage1/";
  // static String productImageUrl="$address//api/owner/category/";

  //authentication
  static String register="https://$address/api/users/register";//register users
  static String login="https://$address//api/users/auth";//login  users


static String getProducts="https://$address/api/products";//get products
static String getCategoryProduct="https://$address/api/products/categories/";// get categories with their products

static String getProductByID="https://$address/api/product/";// product by id

static String getProductCategory="https://$address/api/products/";// product by category


  //get products by category
static String getProductFruit="https://$address/api/products/fruits";// product by fruit
static String getProductRouphages="https://$address/api/products/roughages";// product by rouphages
static String getProductRootTubers="https://$address/api/products/root tubers";// product by rootubers
static String getProductVegatables="https://$address/api/products/vegetables";// product by vegetables
static String getProductGrains="https://$address/api/products/grains and flour";// product by grains
static String getProductMeats="https://$address/api/products/meats";// product by meats
static String getProductFats="https://$address/api/products/fats and oils";// product by fats and oils
static String getProductHerbs="https://$address/api/products/herbs and spices";// product by herbs
static String getProductJuice="https://$address/api/products/juice";// product by juice
static String getProductMeals="https://$address/api/products/popular";// product by meals



static String filterProduct="https://$address/api/ products/filter/";// search product
static String searchProduct="https://$address/api/ products/search/";// search product


}