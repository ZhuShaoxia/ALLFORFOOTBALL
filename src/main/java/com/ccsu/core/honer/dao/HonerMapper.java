package com.ccsu.core.honer.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.honer.domain.Honer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/27
 * @Time: 14:26
 * Description:
 */
@Repository
public interface HonerMapper extends BaseDao<Honer> {
    List<Honer> findHonerByPlayerId(Integer playerId);

    List<Honer> findHonerByClubId(Integer clubId);

    List<Honer> findAllByTypeId(Integer id);
}
