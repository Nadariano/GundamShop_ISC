package db;

public class Product {

    private String product_id;
    private String productName;
    private String origin;
    private double price;
    private String productDetails;
    private String productMaterial;
    private String type_id;
    private String typeName;
    private int brand_id;
    private String brandName;
    private String ratio;
    private String height;
    public Product() {
    }

    //Dung cho insert
    public Product(String product_id, String productName, String origin, double price, String productDetails, String productMaterial, String type_id, int brand_id) {
        this.product_id = product_id;
        this.productName = productName;
        this.origin = origin;
        this.price = price;        
        this.productDetails = productDetails;
        this.productMaterial = productMaterial;
        this.type_id = type_id;
        this.brand_id = brand_id;
    }

    //Dung cho doc het du lieu
    public Product(String product_id, String productName, String origin, double price, String productDetails, String productMaterial, String type_id, String typeName, String brandName, String ratio, String height) {
        this.product_id = product_id;
        this.productName = productName;
        this.origin = origin;
        this.price = price;
        this.productDetails = productDetails;
        this.productMaterial = productMaterial;
        this.type_id = type_id;
        this.typeName = typeName;
        this.brandName = brandName;
        this.ratio = ratio;
        this.height = height;
    }

    
    
    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(String productDetails) {
        this.productDetails = productDetails;
    }

    public String getProductMaterial() {
        return productMaterial;
    }

    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
    }

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getRatio() {
        return ratio;
    }

    public void setRatio(String ratio) {
        this.ratio = ratio;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    
}
