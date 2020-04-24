package top.wsuo.pojo;

/**
 * 商品实体类
 *
 * @Author shuo wang
 * @Date 2020/4/22 0022 14:38
 * @Version 1.0
 */
public class Product {
    private Integer id;
    private String name;
    private String img;
    private Float price;

    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, String name, String img, Float price) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
}
