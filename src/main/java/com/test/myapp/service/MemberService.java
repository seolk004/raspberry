package com.test.myapp.service;

import com.test.myapp.dto.FileDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberService {
    public String getName(String id, String pw);
    public void setUser(@Param("id")String id, @Param("pw")String pw,
                          @Param("gender")String gender, @Param("name")String name, @Param("authority")String authority);


    public void addFile(String id, String name);

    public List<FileDTO> getFile();

}
