package net.kzn.onlineshopping.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class fileUploadUtility {

    private static final String ABS_PATH = "F:\\JAVA\\onlineshopping\\src\\main\\webapp\\assets\\images\\";

    private static final Logger logger = LoggerFactory.getLogger(fileUploadUtility.class);
    public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {

        // get the real server path
        String REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");

        logger.info(REAL_PATH);
        // to make sure all the directory exists
        // please create the directories

        if(!new File(ABS_PATH).exists()) {
            // create the directories
            new File(ABS_PATH).mkdirs();
        }

        if(!new File(REAL_PATH).exists()) {
            // create the directories
            new File(REAL_PATH).mkdirs();
        }

        try {
            //transfer the file to both the location
            file.transferTo(new File(REAL_PATH + code + ".jpg"));
            file.transferTo(new File(ABS_PATH + code + ".jpg"));
        }
        catch(IOException ex) {

        }
    }
}
