# 一、基于MD5算法对密码加密 

## 1.MD5摘要算法

```
1.MD5信息摘要算法广泛使用的密码散列函数
2.MD5可以产生出一个128位的散列值用于唯一标识源数据
3.项目中通常使用MD5作为敏感数据的加密算法
```

## 2.MD5特点

```
1.压缩性，MD5生成的摘要长度固定
2.抗修改，源数据哪怕只有一个字节变化，MD5也会有巨大差异
3.不可逆，无法通过MD5反向推算源数据
```

## 3.Apache  Commons  Codec

```
1.Commons-Codec是Apache提供的编码/解码组件
2.通过Commons-Codec可轻易生成源数据的MD5摘要
3.MD5摘要方法： String md5=DigestUtils.md5Hex(源数据)
```

```xml
<!--common-codec MD5-->
<dependency>
    <groupId>commons-codec</groupId>
    <artifactId>commons-codec</artifactId>
    <version>1.14</version>
</dependency>
```

```java
import org.apache.commons.codec.digest.DigestUtils;
	/**
     * 对源数据生成MD5摘要
     * @param source 源数据
     * @return MD5摘要
     */
public class MD5Utils {
    public static  String md5Digest(String source){
       return DigestUtils.md5Hex(source);
    }
}
```

# 二、敏感数据加盐混淆 

## 1.MD5Utils.java

```java
import org.apache.commons.codec.digest.DigestUtils;

public class MD5Utils {
    /**
     * 对源数据生成MD5摘要
     * @param source 源数据
     * @return MD5摘要
     */
    public static  String md5Digest(String source){
       return DigestUtils.md5Hex(source);
    }

    /**
     * 对源数据加盐混淆后生成MD5摘要
     * @param source 源数据
     * @param salt 盐值
     * @return MD5摘要
     */
    public static  String md5Digest(String source,Integer salt){
       char[] ca= source.toCharArray();//字符数组
        for (int i=0;i<ca.length;i++){
            ca[i]= (char)(ca[i]+salt);
        }
        String target=new String(ca);
        String md5 = DigestUtils.md5Hex(target);
        return md5;
    }

    public static void main(String[] args) {
        System.out.println(MD5Utils.md5Digest("test",192));
    }
}
```

## 2.UserService.java

```java
import com.xiaofeng.oa.dao.RbacDao;
import com.xiaofeng.oa.dao.UserDao;
import com.xiaofeng.oa.entity.Node;
import com.xiaofeng.oa.entity.User;
import com.xiaofeng.oa.service.exception.BussinessException;
import com.xiaofeng.oa.utils.MD5Utils;

import java.util.List;


public class UserService {
    private UserDao userDao = new UserDao();
    private RbacDao rbacDao = new RbacDao();

    /**
     * 根据前台输入进行登录校验
     *
     * @param username 前台输入的用户名
     * @param password 前台输入的密码
     * @return 校验通过后，包含对应用户数据的User实体类
     * @throws BussinessException L001-用户名不存在 L002-密码错误
     */
    public User checkLogin(String username, String password) {
        //按用户名查询用户
        User user = userDao.selectByUsername(username);
        if (user == null) {
            //抛出用户不存在异常
            throw new BussinessException("L001", "用户名不存在");
        }
        //对前台输入的密码加盐混淆后生成MD5，与保存在数据库中的MD5密码进行比对
        String md5=MD5Utils.md5Digest(password,user.getSalt());
        if (!md5.equals(user.getPassword())) {
            //密码错误的情况
            throw new BussinessException("L002", "密码错误");
        }
        return user;
    }

    public List<Node> selectNodeByUserId(Long userId) {
        List<Node> nodeList=rbacDao.selectNodeByUserId(userId);
        return nodeList;
    }
}
```

## 3.User.java

```java
/**
 * 用户类
 */
public class User {
    private Long userId;
    private String username;
    private  String password;
    private Long  employeeId;
    private Integer salt;//盐值

	//getter()和setter()
    	...
}
```

