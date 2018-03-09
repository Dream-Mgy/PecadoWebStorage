package com.neusoft.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.neusoft.dao.LocalFileDao;
import com.neusoft.pojos.LocalFile;
import com.neusoft.pojos.Pagination;

@Service
public class LocalFileServiceImpl implements LocalFileService {

    @Autowired
    private LocalFileDao localFileDao;

    private static final String HDFS_PATH = "/yhl/";
    private static final String SERVER_NAME = "fs.defaultFS";
    private static final String SERVER_ADDRESS = "hdfs://192.168.233.6:9000";

    @Override
    public List<LocalFile> findAllFiles(Pagination pagination, String searchKey) {
        pagination.setTotalCount(localFileDao.getFileCount(searchKey));
        pagination.setCurrentPage((pagination.getCurrentPage() < pagination.getPageCount()) ? pagination.getCurrentPage() : pagination.getPageCount());
        Map<String, Object> indexParam = new HashMap<>();
        indexParam.put("pagination", pagination);
        indexParam.put("searchKey", searchKey);
        List<LocalFile> localFiles = localFileDao.seleceFiles(indexParam);
        return localFiles;
    }

    @Override
    public void insertFiles(List<LocalFile> localFiles) {
        localFileDao.insertFiles(localFiles);
    }

    @Override
    public void uplodaFile(MultipartFile file) {
        Configuration configuration = new Configuration();
        configuration.set(SERVER_NAME, SERVER_ADDRESS);
        FileSystem fileSystem = null;
        InputStream localStream = null;
        FSDataOutputStream fsDataOutputStream = null;
        try {
            fileSystem = FileSystem.get(configuration);
            //use the MultipartFile to get the inputStream
            localStream = file.getInputStream();
            //Make file on the hdfs
            fsDataOutputStream = fileSystem.create(new Path(HDFS_PATH + file.getOriginalFilename()), true);
            byte[] size = new byte[1024];
            while ((localStream.read(size, 0, size.length)) > 0) {
                fsDataOutputStream.write(size);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fsDataOutputStream.close();
                localStream.close();
                fileSystem.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public LocalFile findOne(int fileId) {
        return localFileDao.selectOne(fileId);
    }

    @Override
    public byte[] downloadFile(LocalFile localFile) {
        Configuration configuration = new Configuration();
        configuration.set(SERVER_NAME, SERVER_ADDRESS);
        FileSystem fileSystem = null;
        ByteArrayOutputStream out = null;
        FSDataInputStream fsDataIuputStream = null;
        try {
            fileSystem = FileSystem.get(configuration);
            out = new ByteArrayOutputStream();
            fsDataIuputStream = fileSystem.open(new Path(HDFS_PATH + localFile.getFileName()));
            byte[] size = new byte[1024];
            int len = 0;
            while((len = fsDataIuputStream.read(size)) > 0) {
                out.write(size, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fsDataIuputStream.close();
                out.close();
                fileSystem.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return out.toByteArray();
    }
}
