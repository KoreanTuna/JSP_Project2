package com.example.util;
import com.example.bin.PoketmonDAO;
import com.example.bin.PoketmonVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class PoketmonFileUpload {

    public PoketmonVO uploadPhoto(HttpServletRequest request){
        String filename="";
        int sizeLimit = 15*1024*1024;
        String realPath = request.getServletContext().getRealPath("upload");
//        System.out.println(realPath);

        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        PoketmonVO one = null;
        MultipartRequest multipartRequest = null;

        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");

            one = new PoketmonVO();
            String pid = multipartRequest.getParameter("pid");
            if(pid != null &&! pid.equals("")) one.setPid(Integer.parseInt(pid));
            one.setPnumber(multipartRequest.getParameter("pnumber"));
            one.setPname(multipartRequest.getParameter("pname"));
            one.setType(multipartRequest.getParameter("type"));
            one.setSpcial(multipartRequest.getParameter("spcial"));
            one.setPclass(multipartRequest.getParameter("pclass"));
            one.setCatch_rate(Integer.parseInt(multipartRequest.getParameter("catch_rate")));
            one.setHeight(multipartRequest.getParameter("height"));
            one.setWeight(Double.parseDouble(multipartRequest.getParameter("weight")));
            one.setFamiliar(Integer.parseInt(multipartRequest.getParameter("familiar")));
            one.setDetail(multipartRequest.getParameter("detail"));

            if(pid != null &&! pid.equals("")){
                PoketmonDAO dao = new PoketmonDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(pid));
                if(filename!=null && oldfilename!=null) PoketmonFileUpload.deleteFile(request, oldfilename);
                else if(filename==null && oldfilename!=null) filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();

    }
}
