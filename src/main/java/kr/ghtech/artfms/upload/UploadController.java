package kr.ghtech.artfms.upload;


import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

@Controller
public class UploadController {
    @RequestMapping(value = "/file/image", method = RequestMethod.POST)
    @ResponseBody
    public String uploadForm(MultipartRequest multipartRequest, HttpRequest request) throws IOException {

        return "ok";
    }
    @RequestMapping(value = "/file/upload", method = RequestMethod.POST)
    @ResponseBody
    public Object uploadFile(MultipartHttpServletRequest request) {
//        String uploadPath = request.getSession().getServletContext().getRealPath("/resources/image/local");
//        String uploadPath = "C:\\artFiles\\";
    	String uploadPath = "";
    	String folderName = "";
    	String tempPath = "";
    	
    	if(request.getSession().getServletContext().getRealPath("/").contains("apache-tomcat")) {
    		uploadPath = request.getSession().getServletContext().getRealPath("/resources/image/local/");
    		tempPath = "/";
    	}else {
    		tempPath = "\\";
    		uploadPath = "C:\\dev_test\\scw_temp1\\ARTFMIS\\src\\main\\webapp\\resources\\image\\artFiles\\";
    	}
//        String savedName = "";
        Iterator<String> itr = request.getFileNames();
        if(itr.hasNext()) {
            MultipartFile mpf = request.getFile(itr.next());
            System.out.println(mpf.getOriginalFilename() +" uploaded!");
            try {
                //just temporary save file info into ufile
                System.out.println("file length : " + mpf.getBytes().length);
                System.out.println("file name : " + mpf.getOriginalFilename());
                System.out.println("file ContentType : " + mpf.getContentType());
                
                String imgeType = "";
                String contentType = mpf.getContentType();
                if ("image/gif".equals(contentType)) {
                    imgeType = "gif";
                } else if ("image/png".equals(contentType)) {
                    imgeType = "png";
                } else if ("image/jpeg".equals(contentType)) {
                    imgeType = "jpeg";
                } else if ("image/bmp".equals(contentType)) {
                    imgeType = "bmp";
                } else if ("image/webp".equals(contentType)) {
                    imgeType = "webp";
                }

                if(imgeType.equals("")){
                    return false;
                }

//                UUID uuid = UUID.randomUUID();
//                String uuidStr = uuid.toString();
//                String currentTime = String.valueOf(System.currentTimeMillis());
//                savedName = uuidStr+"_"+currentTime+"."+imgeType;
//                File target = new File(uploadPath, savedName);
                int length = mpf.getOriginalFilename().lastIndexOf(".");
                folderName = mpf.getOriginalFilename().substring(0, length);
                
                File mkdirFolder = new File(uploadPath + folderName);
                
                if(!mkdirFolder.exists()) {
                	mkdirFolder.mkdirs();
                }
                
                File target = new File(uploadPath + folderName + tempPath, mpf.getOriginalFilename());
                FileCopyUtils.copy(mpf.getBytes(), target);
            } catch (IOException e) {
                System.out.println(e.getMessage()); e.printStackTrace();
            }
//            return savedName;
            return mpf.getOriginalFilename();
        } else {
            return false;
        }
    }
}