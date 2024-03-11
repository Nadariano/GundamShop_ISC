package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class ProductFacade {

    private int total;

    public int getTotal() {
        return total;
    }

//    Hien thi tat ca products
    public List<Product> select() throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        String sql = "select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID";
        ResultSet rs = stm.executeQuery(sql);
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        con.close();
        return list;
    }

    public List<Product> select(int startIndex, int endIndex) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        String sql = "select * from  (select Row_Number() over  (order by product_id) as RowIndex, \n"
                + "		* from (select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT \n"
                + "				from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID) as selectAll) \n"
                + "				as Sub Where Sub.RowIndex >= " + startIndex + " and Sub.RowIndex <= " + endIndex;
        ResultSet rs = stm.executeQuery(sql);
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
//         rs.close();
        rs = stm.executeQuery("SELECT COUNT(product_id) as Total FROM product");
        if (rs.next()) {
            this.total = rs.getInt("Total");
        }
        con.close();
        return list;
    }

    public Product read(String id) throws SQLException {
        Product product = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID where p.PRODUCT_ID = ?");
        stm.setString(1, id);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        if (rs.next()) {
            product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
        }
        //Đóng kết nối
        con.close();
        return product;
    }
    
    public Product read1(String product_id) throws SQLException {
        Product product = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from product where product_id = ?");
        stm.setString(1, product_id);
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng product nếu có
        if (rs.next()) {
            product = new Product();
            product.setProduct_id(rs.getString("product_id"));
            product.setProductName(rs.getString("productName"));
            product.setOrigin(rs.getString("origin"));
            product.setPrice(rs.getDouble("price"));
            product.setProductDetails(rs.getString("productDetails"));
            product.setProductMaterial(rs.getString("productMaterial"));
            product.setType_id(rs.getString("type_id"));
            product.setBrand_id(rs.getInt("brand_id"));
        }
        //Đóng kết nối
        con.close();
        return product;
    }

    public List<Product> search(String namePart) throws SQLException {
        List<Product> list = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT\n"
                + "from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID where p.PRODUCTNAME like ?");
        stm.setString(1, "%" + namePart + "%");
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        con.close();
        return list;
    }

    public List<Product> search(String namePart, int startIndex, int endIndex) throws SQLException {
        List<Product> list = null;
        Connection con = DB.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from  (select Row_Number() over  (order by product_id) as RowIndex, * from (\n"
                + "select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT\n"
                + "from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID where p.PRODUCTNAME like ?)\n"
                + "as searchBasedName) as Sub where Sub.RowIndex >= " + startIndex + "and Sub.RowIndex <= " + endIndex);
        stm.setString(1, "%" + namePart + "%");
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        con.close();
        return list;
    }

    public List<Product> getAllProductsByTypeId(String type_id) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID where p.TYPE_ID = ?");
        stm.setString(1, type_id);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        //Đóng kết nối
        con.close();
        return list;
    }

    public List<Product> getAllProductsByTypeId(String type_id, int startIndex, int endIndex) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from  (select Row_Number() over  (order by product_id) as RowIndex,\n"
                + "	* from (select p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRICE,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT \n"
                + "	from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID \n"
                + "	where p.TYPE_ID = ?) as selectBasedType) as Sub Where Sub.RowIndex >= " + startIndex + " and Sub.RowIndex <= " + endIndex);
        stm.setString(1, type_id);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        //Đóng kết nối
        con.close();
        return list;
    }

    public int totalByTypeID(String type_id) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("SELECT COUNT(PRODUCT_ID) as Total FROM PRODUCT where TYPE_ID= ?");
        stm.setString(1, type_id);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        if (rs.next()) {
            this.total = rs.getInt("Total");
        }
        con.close();
        return total;
    }

    public int totalByName(String namePart) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("SELECT COUNT(PRODUCT_ID) as Total FROM PRODUCT where PRODUCTNAME like ?");
        stm.setString(1, "%" + namePart + "%");
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        if (rs.next()) {
            this.total = rs.getInt("Total");
        }
        con.close();
        return total;
    }

    public void create(Product product) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("insert product values(?, ?, ?, ?, ?, ?, ?, ?)");
        stm.setString(1, product.getProduct_id());
        stm.setString(2, product.getProductName());
        stm.setString(3, product.getOrigin());
        stm.setDouble(4, product.getPrice());
        stm.setString(5, product.getProductDetails());
        stm.setString(6, product.getProductMaterial());
        stm.setString(7, product.getType_id());
        stm.setInt(8, product.getBrand_id());
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối
        con.close();
    }

    public void update(Product product) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("update product set PRODUCTNAME = ?, ORIGIN = ?, PRICE = ?, PRODUCTDETAILS = ?, PRODUCTMATERIAL = ?, TYPE_ID = ?, BRAND_ID = ?  where PRODUCT_ID = ?");
        stm.setString(1, product.getProductName());
        stm.setString(2, product.getOrigin());
        stm.setDouble(3, product.getPrice());
        stm.setString(4, product.getProductDetails());
        stm.setString(5, product.getProductMaterial());
        stm.setString(6, product.getType_id());
        stm.setInt(7, product.getBrand_id());
        stm.setString(8, product.getProduct_id());

        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối
        con.close();
    }

    public void delete(String product_id) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("delete from product where PRODUCT_ID = ?");
        stm.setString(1, product_id);
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        con.close();
    }

    public List<Product> sortByPriceAsc(List<Product> list) {
        List<Product> sortedList = list.stream()
                .sorted(Comparator.comparing(Product::getPrice))
                .collect(Collectors.toList());
        return sortedList;
    }

    public List<Product> sortByPriceDesc(List<Product> list) {
        List<Product> sortedList = list.stream()
                .sorted(Comparator.comparing(Product::getPrice).reversed())
                .collect(Collectors.toList());
        return sortedList;
    }

    public List<Product> top3HighestEachType(String type_id) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select top 3 p.PRICE, p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID where p.TYPE_ID = ? order by p.price desc");
        stm.setString(1, type_id);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        //Đóng kết nối
        con.close();
        return list;
    }
    
    public List<Product> top3LowestEachType(String type_id) throws SQLException {
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DB.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select top 3 p.PRICE, p.PRODUCT_ID,p.PRODUCTNAME,p.ORIGIN,p.PRODUCTDETAILS,p.PRODUCTMATERIAL,p.TYPE_ID,t.TYPENAME,b.BRANDNAME,t.RATIO,t.HEIGHT from Brand b join Product p on b.Brand_id=p.brand_id join [TYPES] t on t.TYPE_ID=p.TYPE_ID where p.TYPE_ID = ? order by p.price asc");
        stm.setString(1, type_id);
        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        //Load dữ liệu vào đối tượng toy nếu có
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProduct_id(rs.getString("PRODUCT_ID"));
            product.setProductName(rs.getString("PRODUCTNAME"));
            product.setOrigin(rs.getString("ORIGIN"));
            product.setPrice(rs.getDouble("PRICE"));
            product.setProductDetails(rs.getString("PRODUCTDETAILS"));
            product.setProductMaterial(rs.getString("PRODUCTMATERIAL"));
            product.setType_id(rs.getString("TYPE_ID"));
            product.setTypeName(rs.getString("TYPENAME"));
            product.setBrandName(rs.getString("BRANDNAME"));
            product.setRatio(rs.getString("RATIO"));
            product.setHeight(rs.getString("HEIGHT"));
            list.add(product);
        }
        //Đóng kết nối
        con.close();
        return list;
    }

}
