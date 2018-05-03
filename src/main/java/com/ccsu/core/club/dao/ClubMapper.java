package com.ccsu.core.club.dao;

import com.ccsu.common.base.BaseDao;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.common.domain.Select2ResponseDto;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/10
 * @Time: 18:13
 * Description:
 */
@Repository
public interface ClubMapper extends BaseDao<Club> {
    Integer verifyClubName(String name) throws Exception;

    List<Club> searchClubForSelect(String condition) throws Exception;

    List<Club> searchClubByCountryId(Integer countryId) throws Exception;

    List<Club> searchClubAndCountryByClubId(Integer clubId) throws Exception;

    List<Select2ResponseDto> searchSelect2Club(String term);
}
