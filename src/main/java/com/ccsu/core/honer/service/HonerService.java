package com.ccsu.core.honer.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.honer.domain.Honer;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/27
 * @Time: 14:25
 * Description:
 */
public interface HonerService extends BaseService<Honer> {
    List<Honer> findHonerByPlayerId(Integer playerId);

    List<Honer> findHonerByClubId(Integer clubId);

    List<Honer> findAllByTypeId(Integer id);

}
