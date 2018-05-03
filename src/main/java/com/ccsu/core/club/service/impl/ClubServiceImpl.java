package com.ccsu.core.club.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.club.dao.ClubMapper;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.club.service.ClubService;
import com.ccsu.core.common.domain.Select2ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/10
 * @Time: 18:13
 * Description:
 */
@Service
public class ClubServiceImpl implements ClubService {

    @Autowired
    private ClubMapper clubMapper;

    @Override
    public void add(Club entity) throws Exception {
        String currentTime = CommonUtils.getCurrentDateTime();
        entity.setModifiedTime(currentTime);
        entity.setCreateTime(currentTime);
        clubMapper.save(entity);
    }

    @Override
    public void delete(Integer id) throws Exception {
        clubMapper.delete(id);
    }

    @Override
    public void update(Club entity) throws Exception {
        String modifiedTime = CommonUtils.getCurrentDateTime();
        entity.setModifiedTime(modifiedTime);
        clubMapper.update(entity);
    }

    @Override
    public Club load(Integer id) throws Exception {
        return clubMapper.findById(id);
    }

    @Override
    public List<Club> findAll(String condition) throws Exception {
        return clubMapper.findAll(condition);
    }

    @Override
    public Boolean verifyClubName(String name) throws Exception {
        Integer count = clubMapper.verifyClubName(name);
        if (count >= 1) {
            return true;
        }
        return false;
    }

    /**
     * 下拉框动态搜索
     *
     * @param condition
     * @return
     */
    @Override
    public List<Club> searchClubForSelect(String condition) throws Exception {
        return clubMapper.searchClubForSelect(condition);
    }


    @Override
    public List<Club> searchClubByCountryId(Integer countryId) throws Exception {
        return clubMapper.searchClubByCountryId(countryId);
    }

    @Override
    public List<Club> searchClubAndCountryByClubId(Integer clubId) throws Exception {
        return clubMapper.searchClubAndCountryByClubId(clubId);
    }

    @Override
    public List<Select2ResponseDto> searchSelect2Club(String term) {
        return clubMapper.searchSelect2Club(term);
    }
}
