package com.longlian.console.dao;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface CourseDetailStatictisMapper {
   // void update(@Param("map") Map map);

    int insert(@Param("map") Map map);
    Map getCourseDetailStatictisByCourse(@Param("courseId") long courseId, @Param("map") Map map);
    Map getCourseDatasRange(@Param("map") Map map);

}
