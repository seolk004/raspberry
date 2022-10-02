package com.test.myapp.dao;

import com.test.myapp.dto.FileDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberDAO {
    public String getName(@Param("id")String id, @Param("pw")String pw);
    public void setUser(@Param("id")String id, @Param("pw")String pw,
                          @Param("gender")String gender, @Param("name")String name, @Param("authority")String authority);

    public void addFile(@Param("id")String id, @Param("name")String name);

    public List<FileDTO> getFile();

}
