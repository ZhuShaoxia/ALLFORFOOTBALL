package com.ccsu.core.player.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.common.domain.Select2ResponseDto;
import com.ccsu.core.player.domain.Player;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/11
 * @Time: 11:58
 * Description:
 */
public interface PlayerService extends BaseService<Player> {
    List<Player> getPlayerByMatchInfoId(Integer matchInfoId);

    List<Player> searchPlayerByClubId(Integer clubId);

    List<Select2ResponseDto> searchSelect2Player(String term);

    List<Player> searchMatchLineUp(Integer matchInfoId, Integer clubId, Integer playerType);

}
