package com.longlian.live.dao;

import com.longlian.dto.CourseDto;
import com.longlian.dto.CourseRelayDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/7/11.
 */
public interface CourseRelayMapper {
    /**
     * 创建转播
     * @param courseRelayDto
     */
    void createRelayCourse(CourseRelayDto courseRelayDto);

    /**
     * 通过appid和原课程id查询
     * @param appId
     * @param oriCourseId
     * @return
     */
    CourseRelayDto queryByAppidAndOriCourseId(@Param("appId")long appId, @Param("oriCourseId")String oriCourseId);

    /**
     * 通过ID查询
     * @param id
     * @return
     */
    CourseRelayDto queryById(@Param("id")long id);

    /**
     * 查询最近的一条转播记录
     * @param appId
     * @return
     */
    CourseRelayDto queryByCreateTime(@Param("appId")long appId);

    /**
     * 正在直播的课程
     * @param appId
     * @return
     */
    List<CourseRelayDto> queryByPlayingCourse(@Param("appId")long appId);

    /**
     * 转播课数
     * @param appId
     * @return
     */
    int getRelayCountByOriAppId(long appId);

    /**
     * 创建系列课转播
     * @param appId
     */
    long createRelaySeriesCourse(@Param("id")long id,@Param("appId")long appId, @Param("roomId")long roomId);

    /**
     * 给转播人新增记录
     * @param course
     */
    void insertSeriesSingleCourse(CourseDto course);

     /** 获取转播课程信息
     * @param courseRelayDto 封装课程查询信息
     * @return
     */
    List<CourseRelayDto> getRelayCourse(CourseRelayDto courseRelayDto);

    void createRelaySeriesSingleCourse(@Param("id")long id,@Param("appId")long appId, @Param("roomId")long roomId);

    double queryRelayIncomeCntByOriCourse(@Param("courseId")long courseId);

    int queryProfitIncomeCntByOriCourse(@Param("courseId")long courseId);

    void deleteRelayCourse(@Param("oriCourseId") long id);

    void deleteSeriesRelayCourse(@Param("oriCourseId") long id);

    void deleteRelayCourseById(@Param("id") Long id);

    int hasRelayCoursePayIncomeById(@Param("courseId")long courseId);

    void setDownRelayCourseByOriCourse(@Param("oriCourseId")long id);
}