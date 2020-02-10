package com.ccsu.afterleaveschool.validation.studyValidator2;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/8
 * @Time: 17:21
 * Description:JSR 303:Bean Validation
 * 验证器实现的第二种方法：在pom中需导入javax.validation.validation-api方法
 *可以自定义来自验证器的错误消息
 *在message.properties中修改
 * eg:Size.product.name = product name is not allowed null.
 * springMvc 的参数验证 BindingResult result 的使用
 */
public class Product {
    @NotNull()
    private String name;
    //正则表达式的方式
    @Pattern(regexp = "\\d{3}")
    private String description;
    @Size(min = 2 ,max = 20)
    private Float price;

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
