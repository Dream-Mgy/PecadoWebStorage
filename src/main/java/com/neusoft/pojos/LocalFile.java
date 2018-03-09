package com.neusoft.pojos;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LocalFile {

    private int id;

    private String fileName;

    private String fileSize;

    private Timestamp createTime;
}
