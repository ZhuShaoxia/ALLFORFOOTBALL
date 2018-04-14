package com.ccsu.core.common.controller;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.common.utils.MessageCode;
import com.ccsu.core.common.domain.ResponseDto;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/4
 * @Time: 09:49
 * Description:公共controller
 */
@Controller
public class CommonController {

    /**
     * 图片上传
     * @param file
     * @param type
     * @return
     */
    @RequestMapping("/upload/img")
    public @ResponseBody
    ResponseDto uploadImg(MultipartFile file, String type) {
        String fileName = CommonUtils.UUIDGenerate();
        String originalFilename = file.getOriginalFilename();
        //文件扩展名
        String extension = FilenameUtils.getExtension(originalFilename);
        String realPath = "/Users/zhuxiaolei/IdeaProjects/ALLFORFOOTBALLUPLOAD/" + fileName + "." + extension;
        File f = new File(realPath);
        String url = null;
        try {
            //文件保存路径
            file.transferTo(f);
            url = "/uploadImg/" + fileName + "." + extension;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("文件保存失败");
        }
        ResponseDto responseDto = new ResponseDto();
        responseDto.setCode(MessageCode.SUCCESS);
        responseDto.setUrl(url);
        return responseDto;
    }

}
