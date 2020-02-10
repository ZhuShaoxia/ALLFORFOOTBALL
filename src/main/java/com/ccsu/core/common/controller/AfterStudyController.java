package com.ccsu.core.common.controller;

import com.ccsu.core.common.domain.ResponseDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/7/9
 * @Time: 20:28
 * Description:
 */
@Controller
public class AfterStudyController {
    private ResponseDto responseDto = new ResponseDto();
    private static final Log LOGGER = LogFactory.getLog(AfterStudyController.class);

    @RequestMapping("/after/study")
    public @ResponseBody ResponseDto study() {
        //测试日志输出到文件中的功能
        LOGGER.debug( "iamzhuxiaolei");
        return responseDto;
    }
}
