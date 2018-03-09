package com.neusoft.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.neusoft.pojos.LocalFile;
import com.neusoft.pojos.Pagination;
import com.neusoft.service.LocalFileService;

@Controller
public class IndexController {

    @Autowired
    private LocalFileService localFileService;

    @RequestMapping("index.do")
    public String getIndex(
            ModelMap modelMap,
            @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
            @RequestParam(value = "searchKey", defaultValue = "") String searchKey) {
        Pagination pagination = new Pagination();
        pagination.setCurrentPage(currentPage);
        List<LocalFile> localFiles = localFileService.findAllFiles(pagination, searchKey);
        modelMap.addAttribute("localFiles", localFiles);
        modelMap.addAttribute("pagination", pagination);
        return "index";
    }

    @RequestMapping("upLoad.do")
    public String uploadFilePage() {
        return "uploadPage";
    }

    @RequestMapping("upload.do")
    public String uploadFile(MultipartFile file, ModelMap modelMap) {
        LocalFile localFile = new LocalFile();
        if (file == null) {
           return "error/500";
        }
        localFile.setFileName(file.getOriginalFilename());
        localFile.setFileSize(String.valueOf(file.getSize()));
        List<LocalFile> files = new ArrayList<>();
        files.add(localFile);
        localFileService.insertFiles(files);
        localFileService.uplodaFile(file);
        return "redirect:/index.do";
    }

    @RequestMapping("download.do")
    public ResponseEntity<byte[]> downloadFile(
            HttpServletRequest request,
            int fileId,
            ModelMap modelMap) {
        LocalFile localFile = localFileService.findOne(fileId);
        //Judge if the file is exist;
        if (localFile == null) {
            modelMap.addAttribute("errorMessage", "Can't find the file!");
            return null;
        }
        HttpHeaders headers = new HttpHeaders();
        String downloadFielName = "";
        try {
            downloadFielName = new String(localFile.getFileName().getBytes("UTF-8"),"iso-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        headers.setContentDispositionFormData("attachment", downloadFielName);
        return new ResponseEntity<byte[]>(localFileService.downloadFile(localFile),headers, HttpStatus.CREATED);
    }
}
