package com.ccsu.core.club.service;

import com.ccsu.common.base.BaseService;
import com.ccsu.core.club.domain.Club;
import com.ccsu.core.common.domain.Select2ResponseDto;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/10
 * @Time: 18:13
 * Description:
 */
public interface ClubService extends BaseService<Club> {

    Boolean verifyClubName(String name) throws Exception;

    List<Club> searchClubForSelect(String condition) throws Exception;

    List<Club> searchClubByCountryId(Integer countryId) throws Exception;

    List<Club> searchClubAndCountryByClubId(Integer clubId) throws Exception;

    List<Select2ResponseDto> searchSelect2Club(String term);

}
