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
    private String description;
    private Float price;

    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, String name, String description, Float price) {
        this.id = id;
        this.name = name;
        this.description = description;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
}
