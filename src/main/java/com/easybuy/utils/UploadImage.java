package com.easybuy.utils;

import com.easybuy.entity.EasybuyProduct;
import com.easybuy.entity.EasybuyUser;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class UploadImage {
    public static void uploadImage(String serverpath, EasybuyUser user,
                                   MultipartFile upload) throws IOException {
        String path = "upload/images/";
        File file = new File(serverpath + path);
        if (!file.isDirectory()) {
            file.mkdirs();
        }
       // 获取上传文件项名称,做文件名称随机处理避免上传相同文件名覆盖
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String originalFilename = upload.getOriginalFilename();

        if (originalFilename != null && !originalFilename.equals("")) {
            String fileName = uuid + "_" + upload.getOriginalFilename();
            // 这里是upload.getOriginalFilename()而不是upload.getName()后者只是得到文件项的名字
            upload.transferTo(new File(serverpath + path, fileName));
            user.setEuFilepath(path+fileName);
        } else {
            user.setEuFilepath(null);
        }
    }

    public static void uploadImage(String serverpath, EasybuyProduct product,
                                   MultipartFile upload) throws IOException {
        String path = "upload/images/";
        File file = new File(serverpath + path);
        if (!file.isDirectory()) {
            file.mkdirs();
        }
        // 获取上传文件项名称,做文件名称随机处理避免上传相同文件名覆盖
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String originalFilename = upload.getOriginalFilename();

        if (originalFilename != null && !originalFilename.equals("")) {
            String fileName = uuid + "_" + upload.getOriginalFilename();
            // 这里是upload.getOriginalFilename()而不是upload.getName()后者只是得到文件项的名字
            upload.transferTo(new File(serverpath + path, fileName));
            product.setEpFileName(path + fileName);
        }
    }


}


