package com.house.util;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import org.joda.time.DateTime;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Component
public class ConstantPropertiesUtil {
    public static String END_POINT = "oss-cn-beijing.aliyuncs.com";
    ;
    public static String ACCESS_KEY_ID = "输入你自己的id";
    public static String ACCESS_KEY_SECRET = "输入你自己的secret";
    public static String BUCKET_NAME = "输入你自己的bucket_name";
    public static String FILE_HOST;

    public static String uploadFileToOss(MultipartFile file) {

        // 创建OSSClient实例。
        try {
            String uploadUrl;
            OSS ossClient = new OSSClientBuilder().build(END_POINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);

            // 上传文件流。
            InputStream inputStream = file.getInputStream();
            // 获取文件的名称
            String fileName = file.getOriginalFilename();

            // 1. 在文件夹里面添加随机唯一的值
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            fileName = uuid + fileName;

            // 2. 把文件按照日期进行分类
            // 获取当前的日期
            String datePath = new DateTime().toString("yyyy/MM/dd");
            fileName = datePath + "/" + fileName;
            // 第一个参数，bucketName
            // 第二个参数  上传oss文件路径和文件名称
            // 第三个参数  inputStream
            ossClient.putObject(BUCKET_NAME, fileName, inputStream);

            // 关闭OSSClient。
            ossClient.shutdown();
            // 把上传之后文件路径返回
            // 需要把上传的路径拼接出来
            uploadUrl = "https://" + BUCKET_NAME + "." + END_POINT + "/" + fileName;
            return uploadUrl;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
}
