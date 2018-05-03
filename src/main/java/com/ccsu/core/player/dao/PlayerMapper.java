package com.ccsu.core.player.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.common.domain.Select2ResponseDto;
import com.ccsu.core.player.domain.Player;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/10
 * @Time: 17:34
 * Description:
 */
@Repository
public interface PlayerMapper extends BaseDao<Player> {
    List<Player> getPlayerByMatchInfoId(Integer matchInfoId);

    List<Player> searchPlayerByClubId(Integer clubId);
    List<Player> searchMatchLineUp(String[] players);

    List<Select2ResponseDto> searchSelect2Player(String term);
}
