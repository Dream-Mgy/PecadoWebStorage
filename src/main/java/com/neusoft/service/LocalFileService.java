package com.neusoft.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.neusoft.pojos.LocalFile;
import com.neusoft.pojos.Pagination;


public interface LocalFileService {

    public List<LocalFile> findAllFiles(Pagination pagination, String searchKey);

    public void insertFiles(List<LocalFile> localFiles);

    public void uplodaFile(MultipartFile file);

    public LocalFile findOne(int fileId);

    public byte[] downloadFile(LocalFile localFile);
}
