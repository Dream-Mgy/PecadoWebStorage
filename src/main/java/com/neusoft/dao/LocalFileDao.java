package com.neusoft.dao;

import java.util.List;
import java.util.Map;

import com.neusoft.pojos.LocalFile;

public interface LocalFileDao {

    public List<LocalFile> seleceFiles(Map<String, Object> indexParam);

    public LocalFile selectOne(int fileId);

    public void insertFiles(List<LocalFile> localFiles);

    public int getFileCount(String searchKey);

}
