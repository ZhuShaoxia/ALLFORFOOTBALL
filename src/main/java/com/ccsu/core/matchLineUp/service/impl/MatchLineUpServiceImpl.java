package com.ccsu.core.matchLineUp.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.matchInfo.domain.MatchInfo;
import com.ccsu.core.matchLineUp.dao.MatchLineUpMapper;
import com.ccsu.core.matchLineUp.domain.MatchLineUp;
import com.ccsu.core.matchLineUp.domain.RequestMatchLineUp;
import com.ccsu.core.matchLineUp.service.MatchLineUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/23
 * @Time: 16:44
 * Description:
 */
@Service
public class MatchLineUpServiceImpl implements MatchLineUpService {

    @Autowired
    private MatchLineUpMapper matchLineUpMapper;

    @Override
    public void add(MatchLineUp entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(MatchLineUp entity) throws Exception {

    }

    @Override
    public MatchLineUp load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<MatchLineUp> findAll(String condition) throws Exception {
        return null;
    }

    @Override
    public void addMatchLineUp(RequestMatchLineUp requestMatchLineUp) throws Exception {
        String[] homeClubPlayerFirstStart = requestMatchLineUp.getHomeClubPlayerFirstStart();
        String[] homeClubPlayerSubstitutes = requestMatchLineUp.getHomeClubPlayerSubstitutes();
        String[] awayClubPlayerFirstStart = requestMatchLineUp.getAwayClubPlayerFirstStart();
        String[] awayClubPlayerSubstitutes = requestMatchLineUp.getAwayClubPlayerSubstitutes();
        MatchLineUp matchLineUp;
        Club homeClub = requestMatchLineUp.getHomeClub();
        Club awayClub = requestMatchLineUp.getAwayClub();
        String players;
        MatchInfo matchInfo = requestMatchLineUp.getMatchInfo();

        String currentDateTime = CommonUtils.getCurrentDateTime();
        if (homeClubPlayerFirstStart == null) {
            throw new Exception("首发阵容为空");
        } else {
            players = convertArray(homeClubPlayerFirstStart);
            matchLineUp = new MatchLineUp(matchInfo, homeClub, 1, players, currentDateTime, currentDateTime);
            matchLineUpMapper.save(matchLineUp);
        }
        if (homeClubPlayerSubstitutes != null) {
            players = convertArray(homeClubPlayerSubstitutes);
            matchLineUp = new MatchLineUp(matchInfo, homeClub, 2, players, currentDateTime, currentDateTime);
            matchLineUpMapper.save(matchLineUp);
        }

        if (awayClubPlayerFirstStart == null) {
            throw new Exception("替补阵容为空");
        } else {
            players = convertArray(awayClubPlayerFirstStart);
            matchLineUp = new MatchLineUp(matchInfo, awayClub, 1, players, currentDateTime, currentDateTime);
            matchLineUpMapper.save(matchLineUp);
        }

        if (awayClubPlayerSubstitutes != null) {
            players = convertArray(awayClubPlayerSubstitutes);
            matchLineUp = new MatchLineUp(matchInfo, awayClub, 2, players, currentDateTime, currentDateTime);
            matchLineUpMapper.save(matchLineUp);
        }

    }

    @Override
    public String searchMatchLineUpPlayers(Integer matchInfoId, Integer clubId, Integer playerType) {
        return matchLineUpMapper.searchMatchLineUpPlayers(matchInfoId, clubId, playerType);
    }

    private static String convertArray(String[] array) {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < array.length; i++) {
            if (i != array.length - 1) {
                stringBuilder.append(array[i]).append(",");
            } else {
                stringBuilder.append(array[i]);
            }
        }
        return stringBuilder.toString();
    }

}
